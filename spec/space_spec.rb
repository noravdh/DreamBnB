require 'space'

describe Space do
  it 'can add a space' do
    space = Space.create("Sunny Appartment")

    expect(space.name).to eq "Sunny Appartment"
  end
end