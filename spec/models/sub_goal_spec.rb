require 'rails_helper'

describe SubGoal do
  it 'is instantiable' do
    expect{ sub_goal = SubGoal.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    sub_goal = SubGoal.new

    expect(sub_goal.goal_id).to be_nil
    expect(sub_goal.content).to be_nil
    expect(sub_goal.is_complete).to be_nil
  end
end
