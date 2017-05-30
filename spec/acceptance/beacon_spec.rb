require 'open-uri'

RSpec.describe 'Run server' do
  before :all do
    @web_server = Process.spawn(
        'spec/helpers/http_server.rb',
        in: :close,
        out: 'tmp/httpd-out.log',
        err: 'tmp/httpd-err.log'
    )

    sleep 2
  end

  it 'integration test' do
    actual = `ruby beacon/beacon.rb`

    expected = "0, 10\n" +
               "1, 6\n"  +
               "2, 5\n"  +
               "3, 6\n"  +
               "4, 9\n"  +
               "5, 10\n" +
               "6, 11\n" +
               "7, 8\n"  +
               "8, 8\n"  +
               "9, 13\n" +
               "A, 8\n"  +
               "B, 4\n"  +
               "C, 9\n"  +
               "D, 5\n"  +
               "E, 5\n"  +
               "F, 11\n"

    expect(actual).to eq(expected)
  end

  after :all do
    Process.kill 'KILL', @web_server
  end
end