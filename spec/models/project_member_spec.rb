require 'rails_helper'

describe ProjectMember do
  it 'is instantiable' do
    expect{ project_member = ProjectMember.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    project_member = ProjectMember.new

    expect(project_member.project_id).to be_nil
    expect(project_member.member_id).to be_nil
  end
end
