require 'rails_helper'

describe Goal do
  it 'is instantiable' do
    expect{ goal = Goal.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    goal = Goal.new

    expect(goal.user_id).to be_nil
    expect(goal.category_id).to be_nil
    expect(goal.content).to be_nil
    expect(goal.by_when).to be_nil
    expect(goal.is_private).to be_nil
  end
end
