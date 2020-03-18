require 'space'

describe Space do
  it 'can add a space' do
    space = Space.create(space_name: "Sunny Appartment")

    expect(space.name).to eq "Sunny Appartment"
  end

  it 'can list all spaces' do
    space = Space.create(space_name: "Sunny Appartment")
    spaces = Space.all

    expect(spaces.first.name).to eq "Sunny Appartment"
  end
end
