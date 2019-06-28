require 'rails_helper'

describe Category do
  it 'is instantiable' do
    expect{ category = Category.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    category = Category.new

    expect(category.name).to be_nil
  end
end
