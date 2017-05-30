describe 'messages on incorrect params' do
  it 'returns message if --from is bigger then --to' do
    result = `ruby beacon/beacon.rb --from "1 day ago" --to "2 days ago"`
    expect(result).to eq("Expected that --to is bigger than --from\n")
  end

  it 'returns message if --from is less then 09/05/2013 6:39 pm' do
    result = `ruby beacon/beacon.rb --from "1000 months ago" --to "2 days ago"`
    expect(result).to eq("--from can't be earlier then 09/05/2013 6:39 pm\n")
  end
end