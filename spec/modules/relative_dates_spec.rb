require_relative '../../beacon/beacon'

describe 'commandline' do
  it 'works with multiple months' do
    actual   = Beacon.decode_time('3 months ago').month
    expected = (DateTime.now << 3).month

    expect(actual).to eq(expected)
  end

  it 'works with single month' do
    actual   = Beacon.decode_time('1 month ago').month
    expected = (DateTime.now << 1).month

    expect(actual).to eq(expected)
  end

  it 'works with multiple days' do
    actual   = Beacon.decode_time('3 days ago').day
    expected = (DateTime.now - 3).day

    expect(actual).to eq(expected)
  end

  it 'works with single day' do
    actual   = Beacon.decode_time('1 day ago').day
    expected = (DateTime.now - 1).day

    expect(actual).to eq(expected)
  end

  it 'works with multiple hours' do
    actual   = Beacon.decode_time('3 hours ago').hour
    expected = (DateTime.now - Rational(3, 24)).hour

    expect(actual).to eq(expected)
  end

  it 'works with single hour' do
    actual   = Beacon.decode_time('1 hour ago').hour
    expected = (DateTime.now - Rational(1, 24)).hour

    expect(actual).to eq(expected)
  end

  it 'works with multiple minutes' do
    actual   = Beacon.decode_time('3 minutes ago').minute
    expected = (DateTime.now - Rational(3, 1440)).minute

    expect(actual).to eq(expected)
  end

  it 'works with single minute' do
    actual   = Beacon.decode_time('1 minute ago').minute
    expected = (DateTime.now - Rational(1, 1440)).minute

    expect(actual).to eq(expected)
  end

  it 'gives only 1 second' do
    actual   = Beacon.decode_time('1 minute ago').sec
    expected = 1

    expect(actual).to eq(expected)
  end
end

