require_relative '../../beacon/modules/beacon_core'

describe 'Commandline parameters parsing' do
  before(:each) do
    ARGV.clear
  end

  it 'have no parameters' do
    expect(Beacon.params[:to]).to be_empty
    expect(Beacon.params[:from]).to be_empty
    expect(Beacon.params[:server]).to be_empty
  end

  it 'have --from' do
    ARGV.push('--from', '3 days ago')

    expect(Beacon.params[:to]).to be_empty
    expect(Beacon.params[:from]).to eq('3 days ago')
    expect(Beacon.params[:server]).to be_empty
  end

  it 'have --to' do
    ARGV.push('--to', '7 days ago')

    expect(Beacon.params[:to]).to eq('7 days ago')
    expect(Beacon.params[:from]).to be_empty
    expect(Beacon.params[:server]).to be_empty
  end

  it 'have --server' do
    ARGV.push('--server', '192.168.1.1')

    expect(Beacon.params[:to]).to be_empty
    expect(Beacon.params[:from]).to be_empty
    expect(Beacon.params[:server]).to eq('192.168.1.1')
  end
end