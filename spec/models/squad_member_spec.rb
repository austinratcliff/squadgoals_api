require 'rails_helper'

describe SquadMember do
  it 'is instantiable' do
    expect{ squad_member = SquadMember.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    squad_member = SquadMember.new

    expect(squad_member.squad_id).to be_nil
    expect(squad_member.member_id).to be_nil
  end
end
