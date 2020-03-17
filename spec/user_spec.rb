require 'user'

describe User do
  it 'can add a user name' do
    user = User.new('Avril', 'password')
    expect(user.user_name).to eq 'Avril'
  end
end
