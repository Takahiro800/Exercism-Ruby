class Transpose
  def self.transpose(input)
    input = input.split("\n")
    len = input.size
    p len

    result = <<~EOF
    EOF

    max_length = 1
    input.each { |i| max_length = i.length if max_length < i.length }

    (0...max_length).to_a.each do |i|
      add_letter = ''
      input.each do |char|
        if char[i] || char[i] == ' '
          add_letter += (char[i])
        else
          add_letter += ' '
        end
      end
      result << add_letter + "\n"
    end

    result.chomp!.rstrip!

    # puts result
    return result || ''
  end
end

expected = "TAAA\nh   \nelll\n ooi\nlnnn\nogge\nn e.\nglr\nei \nsnl\ntei\n .n\nl e\ni .\nn\ne\n."
p expected

input = "The longest line.\nA long line.\nA longer line.\nA line."
p Transpose.transpose(input)
