require 'rails_helper'

describe ProjectSubGoal do
  it 'is instantiable' do
    expect{ project_sub_goal = ProjectSubGoal.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    project_sub_goal = ProjectSubGoal.new

    expect(project_sub_goal.project_goal_id).to be_nil
    expect(project_sub_goal.content).to be_nil
    expect(project_sub_goal.is_complete).to be_nil
  end
end
