require 'date'

module RelativeDates
  def decode_time(time)
    current_time = DateTime.now

    result       = current_time << find_units_number(time, :months)
    result       = result - find_units_number(time, :days)
    result       = result - Rational(find_units_number(time, :hours),   24)
    result       = result - Rational(find_units_number(time, :minutes), 1440)
    result       = result - Rational(result.sec - 1, 86400)

    result
  end

  def find_units_number(time, units)
    t = time.scan %r{(\d+)\s+#{units}{0,1}}

    # no units found
    return 0 if t.empty?

    t.first.first.to_i
  end
end