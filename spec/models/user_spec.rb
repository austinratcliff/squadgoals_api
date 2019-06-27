require 'rails_helper'

describe User do
  it 'is instantiable' do
    expect{ user = User.new }.not_to raise_error
  end

  it 'defaults attributes to nil' do
    user = User.new

    expect(user.first_name).to be_nil
    expect(user.last_name).to be_nil
    expect(user.name).to be_nil
    expect(user.email).to be_nil
    expect(user.phone).to be_nil
    expect(user.password_digest).to be_nil
  end
end
