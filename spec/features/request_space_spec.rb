feature "Users can request a space" do
  scenario "visiting the /spaces page" do
    space = Space.create(space_name: "Sunny Appartment", space_description: "test description", space_price: "500")
    visit ('/spaces')
    click_button 'Request'
    expect(page).to have_content "Availability:"
  end
end