require 'rails_helper'

describe Collaboration do
  it 'is instantiable' do
    expect{ collaboration = Collaboration.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    collaboration = Collaboration.new

    expect(collaboration.requester_id).to be_nil
    expect(collaboration.requestee_id).to be_nil
    expect(collaboration.requester_goal_id).to be_nil
    expect(collaboration.requestee_goal_id).to be_nil
    expect(collaboration.request_status_id).to be_nil
  end
end
