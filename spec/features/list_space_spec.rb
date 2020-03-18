feature 'See all spaces' do
  scenario 'See the list of spaces' do
    space = Space.create(space_name: "Sunny Appartment")
    visit('/spaces')
    expect(page).to have_content "Sunny Appartment"
  end
end
