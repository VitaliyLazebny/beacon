#!/usr/bin/env ruby
require 'webrick'

server = WEBrick::HTTPServer.new(
    :Port   => 8000
)

server.mount_proc '/rest/record/previous/' do |req, res|
  res.body = File.open('spec/test_data/count.xml', &:gets)
end

server.start