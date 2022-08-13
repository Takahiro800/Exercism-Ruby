class Board
  def self.transform(inp)
    max_len = inp.max { |x, y| x.length <=> y.length }.length
    min_len = inp.min { |x, y| x.length <=> y.length }.length

    raise ArgumentError if max_len != min_len
    raise ArgumentError unless inp[0] =~ /^\+-+\+$/
    raise ArgumentError unless inp[-1] =~ /^\+-+\+$/

    height = inp.size
    width = inp[0].length

    for i in 1...(height - 1)
      raise ArgumentError unless inp[i] =~ /^\|(\*| )*\|$/
    end

    board = set_board(inp)

    for i in 1...height
      for j in 0...width
        if inp[i].chars[j] == '*'
          board[i][j] = '*'

          # 縦
          board[i - 1][j] += 1 if i > 1 && board[i - 1][j] != '*'
          board[i + 1][j] += 1 if i < height - 2 && board[i + 1][j] != '*'

          # 横
          board[i][j - 1] += 1 if j > 0 && board[i][j - 1] != '*'
          board[i][j + 1] += 1 if j < width - 2 && board[i][j + 1] != '*'

          # 斜め
          board[i - 1][j - 1] += 1 if i > 1 && j > 0 && board[i - 1][j - 1] != '*'
          board[i - 1][j + 1] += 1 if i > 1 && j < width - 2 && board[i - 1][j + 1] != '*'
          board[i + 1][j - 1] += 1 if i < height - 2 && j > 0 && board[i + 1][j - 1] != '*'
          board[i + 1][j + 1] += 1 if i < height - 2 && j < width - 2 && board[i + 1][j + 1] != '*'
        end
      end
    end

    board.each { |line| line.map! { |num| num == 0 ? ' ' : num } if line.instance_of?(Array) }
    board.map! do |line|
      next line unless line.instance_of?(Array)

      if line.instance_of?(Array)
        line[0] = '|'
        line[-1] = '|'
        line = line.join
      end
      line
    end
  end

  def self.set_board(inp)
    height = inp.size
    width = inp[0].length

    arr = Array.new(height) { Array.new(width, 0) }
    arr[0] = inp[0]
    arr[-1] = inp[-1]

    return arr
  end
end
