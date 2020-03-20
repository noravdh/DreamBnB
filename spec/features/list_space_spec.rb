feature 'See all spaces' do
  scenario 'See the list of spaces' do

    visit('/spaces')
    expect(page).to have_content "Sunny Appartment"
  end
end
