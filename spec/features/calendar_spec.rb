feature 'Confirmation of dates button' do
  scenario 'click button' do
    visit('/calendar')
    click_button 'Confirm'
    expect(page).to have_button('Confirm')
  end
end
