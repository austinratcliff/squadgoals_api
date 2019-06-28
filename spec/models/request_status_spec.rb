require 'rails_helper'

describe RequestStatus do
  it 'is instantiable' do
    expect{ request_status = RequestStatus.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    request_status = RequestStatus.new

    expect(request_status.name).to be_nil
  end
end
