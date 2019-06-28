require 'rails_helper'

describe Cheer do
  it 'is instantiable' do
    expect{ cheer = Cheer.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    cheer = Cheer.new

    expect(cheer.user_id).to be_nil
    expect(cheer.goal_id).to be_nil
  end
end
