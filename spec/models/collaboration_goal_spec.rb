require 'rails_helper'

describe CollaborationGoal do
  it 'is instantiable' do
    expect{ collaboration_goal = CollaborationGoal.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    collaboration_goal = CollaborationGoal.new

    expect(collaboration_goal.project_id).to be_nil
    expect(collaboration_goal.requester_goal_id).to be_nil
    expect(collaboration_goal.requestee_goal_id).to be_nil
  end
end
