feature "Users can request a space" do
  scenario "visiting the /spaces page" do

    visit ('/spaces')
    click_button 'Request'
    expect(page).to have_content "Availability:"
  end
end
