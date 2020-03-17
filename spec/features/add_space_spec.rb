feature 'Add a space' do
  # scenario 'Users can add get to the add space form' do
  #   visit('/')
  #   click_button('Add space')

  #   expect(page).to have_content 'Add a space below:'
  # end

  scenario 'Users can fill in the form to add a space' do
    visit('/add-space')
    fill_in('name', with: 'Sunny Appartment')
    click_button('Submit')

    expect(page).to have_content 'All appartments:'
  end
end
