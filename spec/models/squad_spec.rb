require 'rails_helper'

describe Squad do
  it 'is instantiable' do
    expect{ squad = Squad.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    squad = Squad.new

    expect(squad.user_id).to be_nil
  end
end
