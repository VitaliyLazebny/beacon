module Response
  def count_result(data, result = {})
    data.each_char do |char|
      if result.has_key?(char)
        result[char] += 1
      else
        result[char]  = 1
      end
    end

    result
  end

  def extract_output_value(response)
    extract_value(response, :outputValue)
  end

  def extract_timestamp(response)
    extract_value(response, :timeStamp).to_i
  end

  def extract_value(response, value_type)
    result = response.scan(%r{<#{value_type}>([\w]+)</#{value_type}>}).first

    return '' unless result

    result.first
  end
end