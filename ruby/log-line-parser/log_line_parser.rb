module LogLineParser
  attr_reader :message, :log_level, :reformat

  def initialize(line)
    match = line.chomp.strip.match(/([A-Z]+)\].+([A-Z].+)/)
    @message = match.captures[1]
    @log_level = match.captures[0].downcase
    @reformat = "#{@message} (#{@log_level})"
  end
end
