#require 'rspec'
#require 'rspec/expectations'

require_relative '../spec/helpers/io_module'

RSpec.configure do |config|
  config.include IOMacros
  #config.extend IOMacros
end
