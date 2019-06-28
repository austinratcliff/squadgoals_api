require 'rails_helper'

describe ProjectGoal do
  it 'is instantiable' do
    expect{ project_goal = ProjectGoal.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    project_goal = ProjectGoal.new

    expect(project_goal.project_id).to be_nil
    expect(project_goal.content).to be_nil
    expect(project_goal.by_when).to be_nil
    expect(project_goal.is_private).to be_nil
  end
end
