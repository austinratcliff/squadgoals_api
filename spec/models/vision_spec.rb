require 'rails_helper'

describe Vision do
  it 'is instantiable' do
    expect{ vision = Vision.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    vision = Vision.new

    expect(vision.user_id).to be_nil
    expect(vision.statement).to be_nil
    expect(vision.timeframe).to be_nil
  end
end
