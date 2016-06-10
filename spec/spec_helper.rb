$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'bundler/setup'
Bundler.setup

require 'rspect_rspec_formatter'
require 'web_helpers'
# require 'silly_format_yay'
 require 'cocaine'

RSpec.configure do |config|
  # some (optional) config here
  # config.raise_errors_for_deprecations!
end
