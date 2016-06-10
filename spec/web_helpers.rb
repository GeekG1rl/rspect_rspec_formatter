
 def reset_config_test
  file_name = './config.rb'
  text = File.read(file_name)
  new_contents = text.gsub("config.backtrace_exclusion_patterns = [/gems/]","")
  File.open(file_name, "w") { |file| file.puts new_contents }
end
