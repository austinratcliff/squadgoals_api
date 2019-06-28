require 'rails_helper'

describe Tagging do
  it 'is instantiable' do
    expect{ tagging = Tagging.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    tagging = Tagging.new

    expect(tagging.goal_id).to be_nil
    expect(tagging.tag_id).to be_nil
  end
end
