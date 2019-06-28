require 'rails_helper'

describe Connection do
  it 'is instantiable' do
    expect{ connection = Connection.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    connection = Connection.new

    expect(connection.requester_id).to be_nil
    expect(connection.requestee_id).to be_nil
    expect(connection.request_status_id).to be_nil
  end
end
