require_relative '../../spec/spec_helper'
require_relative '../../beacon/modules/beacon_core'

describe 'Result output' do
  it 'displaying error message and makes exit' do
    expect do
      output = capture_stdout { Beacon.error('Error') }
      expect(output).to eq('Error')
    end.to raise_error(SystemExit)
  end

  it 'displaying result' do
    output = capture_stdout { Beacon.output(a:100) }
    expect(output).to eq("a, 100\n")
  end
end
