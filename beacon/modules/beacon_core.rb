require_relative 'response'
require_relative 'commandline'
require_relative 'http_requests'
require_relative 'relative_dates'
require_relative 'output'

class Beacon
  extend Commandline
  extend Response
  extend RelativeDates
  extend HTTPRequests
  extend Output

  def self.get_server_data
    server_data   = get_data_from_server(@current_time)
    @current_time = extract_timestamp(server_data)
    @output_val   = extract_output_value(server_data)
  end

  def self.give_results
    @result    = {}

    @from_time = decode_time(from).strftime('%s').to_i
    @to_time   = decode_time(to).strftime('%s').to_i
    @current_time = @to_time

    self.error("Expected that --to is bigger than --from")        if @from_time > @to_time
    self.error("--from can't be earlier then 09/05/2013 6:39 pm") if 1378395540 > @from_time

    self.get_server_data

    if @current_time >= @from_time || @from_time == @to_time
      @result = count_result(@output_val)
    end

    while @current_time >= @from_time
      @result = count_result(@output_val, @result)
      self.get_server_data
    end

    self.output(@result)
  end
end