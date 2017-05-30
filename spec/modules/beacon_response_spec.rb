require_relative '../../beacon/beacon'

describe 'commandline' do
  let(:input) { File.open('spec/test_data/count.xml', &:gets) }

  let(:output_value){
    '50F995C97880A58678494195CAFFA6FDAE07960C3725FF0AD486C102E66' +
    'BD9F30196E981CD46938556793B11932BEF5742DA05E5924C76C0B4AC84' +
    '04FFF73C6A'
  }

  it 'counts correctly' do
    actual   = Beacon.count_result(output_value)
    expected = { "5"=>10, "0"=>10, "F"=>11,
                 "9"=>13, "C"=>9,  "7"=>8,
                 "8"=>8,  "A"=>8,  "6"=>11,
                 "4"=>9,  "1"=>6,  "D"=>5,
                 "E"=>5,  "3"=>6,  "2"=>5,
                 "B"=>4 }

    expect(actual).to eq(expected)
  end

  it 'correctly extracts timestamp' do
    actual   = Beacon.extract_timestamp(input)
    expected = 1495837080

    expect(actual).to eq expected
  end

  it 'correctly extracts output value' do
    actual   = Beacon.extract_output_value(input)
    expected = output_value

    expect(actual).to eq expected
  end
end