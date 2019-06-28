require 'rails_helper'

describe Project do
  it 'is instantiable' do
    expect{ project = Project.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    project = Project.new

    expect(project.user_id).to be_nil
    expect(project.name).to be_nil
    expect(project.description).to be_nil
    expect(project.is_private).to be_nil
  end
end
