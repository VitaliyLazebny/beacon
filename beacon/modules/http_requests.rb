require 'httpclient'

module HTTPRequests
  #Current Record (or next closest):
  #'<base>/rest/record/<timestamp>'
  #Previous Record:
  #'<base>/rest/record/previous/<timestamp>'
  #Next Record:
  #'<base>/rest/record/next/<timestamp>'
  #Last Record:
  #'<base>/rest/record/last'
  #Start Chain Record:
  #'<base>/rest/record/start-chain/<timestamp>'


  def get_last_from_server
    do_request("#{server_url}/rest/record/last")
  end

  def get_data_from_server(time)
    do_request("#{server_url}/rest/record/previous/#{time}")
  end

  def server_url
    return server if server && !server.empty?

    'https://beacon.nist.gov'
  end

  def do_request(uri)
    attempt = 1

    @clnt ||= HTTPClient.new
    result = @clnt.get(uri).body
  rescue Errno::EADDRNOTAVAIL, Errno::ETIMEDOUT,
         HTTPClient::BadResponseError, HTTPClient::TimeoutError

    self.error("Internet connection is unstable can't continue") if attempt > 3

    attempt += 1
    sleep attempt * 3
    retry
  rescue SocketError
    self.error("Please, check internet connection.")
  rescue Errno::ECONNREFUSED
    self.error("Server unavailable")
  end
end