require 'spec_helper'
require 'rspec'
require 'byebug'


describe RspectBacktrace do


  before :all do

     Bundler.with_clean_env do
       @config_text = "config.backtrace_exclusion_patterns = [/gems/]"
      @rspec_result = `cd spec/rspec_tests && bundle exec rspec some_tests.rb`
      @rspec_result_format = `cd spec/rspec_tests ruby -Ilib && ./bin/rspect_rspec_formatter && bundle exec rspec some_tests.rb`
    end
  end
  after(:each) do
    reset_config_test
  end

  it 'adds the custom configuration to the config file' do
    expect(File.read('config.rb')).not_to include @config_text
    `ruby -Ilib ./bin/rspect_rspec_formatter`
    expect(File.read('config.rb')).to include @config_text

  end

  it 'removes gems from the stack trace' do
    expect(@rspec_result_format).not_to include("/gem")
  end

  it 'keeps gems in the stack trace' do
    expect(@rspec_result).to include("/gem")
  end
end




# describe ExclusionGems do
#   before :all do
#      Bundler.with_clean_env do
#        @rspec_result_exc = `cd spec/rspec_tests && bundle exec rspec some_tests.rb --format ExclusionGems`
#
#     end
#   end
#
#   # before do
#   #   @output = @rspec_result.dup
#   #   @output2 = @rspec_result2.dup
#   # end
#
#   it "outputs failures at start of output" do
#
#     puts @rspec_result_exc
#     puts @rspec_result_noformat
#   end
# end
