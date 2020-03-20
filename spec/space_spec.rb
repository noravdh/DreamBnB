require 'space'

describe Space do
  it 'can add a space' do
    space = Space.all.first
    expect(space.name).to eq "Sunny Appartment"
    expect(space.description).to eq "test description"
    expect(space.price).to eq "500"
  end



  it 'can list all spaces' do

    spaces = Space.all

    expect(spaces.first.name).to eq "Sunny Appartment"
  end

end
