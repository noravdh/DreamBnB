require 'user'

describe User do
  it 'can add a user name' do
    user = User.create(user_name: 'Avril', password: 'password')
    expect(user.user_name).to eq 'Avril'
  end
end
