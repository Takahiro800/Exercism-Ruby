class Board
  def self.transform(inp)
    raise ArgumentError unless check_size(inp)
    raise ArgumentError unless check_top_and_bottum(inp)

    height = inp.size
    width = inp[0].length

    for i in 1...(height - 1)
      raise ArgumentError unless inp[i] =~ /^\|(\*| )*\|$/
    end

    board = set_board(inp)

    for i in 1...height
      for j in 0...width
        next unless inp[i].chars[j] == '*'

        update_board(board, i, j)
      end
    end

    finish_up(board)
  end

  def self.check_size(inp)
    max_len = inp.max { |x, y| x.length <=> y.length }.length
    min_len = inp.min { |x, y| x.length <=> y.length }.length

    max_len == min_len
  end

  def self.check_top_and_bottum(inp)
    inp[0] =~ /^\+-+\+$/ && inp[-1] =~ /^\+-+\+$/
  end

  def self.set_board(inp)
    height = inp.size
    width = inp[0].length

    arr = Array.new(height) { Array.new(width, 0) }
    arr[0] = inp[0]
    arr[-1] = inp[-1]

    return arr
  end

  def self.is_bomb?(board, i, j)
    board[i][j] == '*'
  end

  def self.update_cell(board, i, j)
    return if is_bomb?(board, i, j)

    board[i][j] += 1
  end

  def self.update_board(board, i, j)
    height = board.size
    width = board[0].length

    board[i][j] = '*'

    # 縦
    update_cell(board, i - 1, j) if i > 1
    update_cell(board, i + 1, j) if i < height - 2

    # 横
    update_cell(board, i, j - 1) if j > 0
    update_cell(board, i, j + 1) if j < width

    # 斜め
    update_cell(board, i - 1, j - 1) if i > 1 && j > 0
    update_cell(board, i - 1, j + 1) if i > 1 && j < width - 2
    update_cell(board, i + 1, j - 1) if i < height - 2 && j > 0
    update_cell(board, i + 1, j + 1) if i < height - 2 && j < width - 2
  end

  def self.finish_up(board)
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
end
