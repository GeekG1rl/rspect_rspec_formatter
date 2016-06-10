require 'tempfile'
require 'fileutils'

class RspectBacktrace

  def self.add_to_config
    file_name = 'config.rb'
    temp_file = Tempfile.new(file_name)
    line_to_find = "RSpec.configure do |config|"
    text = File.read(file_name)
    line_to_add = "config.backtrace_exclusion_patterns = [/gems/]"
    begin
      File.readlines(file_name).each do |line|
        temp_file.puts(line)
        temp_file.puts(line_to_add) if line.chomp == line_to_find
      end
      temp_file.close
      FileUtils.mv(temp_file.path, file_name)
    ensure
      temp_file.delete
    end
  end
end
