class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    nth = @line.index("]:")
    @line[nth+3..].strip
  end

  def log_level
    nth_s = @line.index("[")
    nth_e = @line.index("]")
    @line[nth_s+1...nth_e].downcase
  end

  def reformat
    "#{self.message} (#{self.log_level})"
  end
end

log = LogLineParser.new('[ERROR]: Invalid operation')
p log.reformat