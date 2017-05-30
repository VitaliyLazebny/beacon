module Output
  def output(data)
    arr = data.to_a.sort {|x,y| x.first <=> y.first }
    arr.each {|elem| puts "#{elem.first}, #{elem.last}"}
  end

  def error(message)
    puts message
    exit
  end
end