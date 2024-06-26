class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(": ").last.strip
  end

  def log_level
    @line.split(": ").first[1..-2].downcase
  end

  def reformat
    "#{self.message} (#{self.log_level})"
  end
end
