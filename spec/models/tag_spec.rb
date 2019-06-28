require 'rails_helper'

describe Tag do
  it 'is instantiable' do
    expect{ tag = Tag.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    tag = Tag.new

    expect(tag.name).to be_nil
  end
end
