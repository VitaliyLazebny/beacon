module Commandline
  def params
    {to: to, from: from, server: server}
  end

  def find_value(value)
    index = ARGV.index value

    return '' unless index

    ARGV[index + 1]
  end

  def to
    find_value '--to'
  end

  def from
    find_value '--from'
  end

  def server
    find_value '--server'
  end
end