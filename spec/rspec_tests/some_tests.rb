
# require File.expand_path(File.join(File.dirname(__FILE__), '..' ,'spec_helper',))
require 'cocaine'
describe 'tests to test the gem' do
  it 'fails logically' do
    expect(1).to eq(2)
  end

  it 'b' do
  end

  it 'c' do
  end

  it 'pends' do
    pending
    raise
  end

  it 'raises a simple error' do
    raise 'shallow failure'
  end

  it 'raises a hidden error' do
    error = ExceptionWrappingException.new('There is an error in this error.')
    error.original_exception = RuntimeError.new('There is no error in this error.')
    raise error
  end

  it 'is a test to show gems in a stack trace' do
    line = Cocaine::CommandLine.new("hhh", "hello 'world'")
    line.run
    expect(line).to eq('hello world')
  end

  it 'e' do
  end

end

class ExceptionWrappingException < RuntimeError
  attr_accessor :original_exception
end
