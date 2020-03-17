require 'spec_helper'

feature 'The homepage' do
  scenario 'Visit homepage' do
    visit ('/')
    expect(page).to have_content 'Welcome to DreamBnB'
  end

  scenario 'The user can sign up with a name and password' do
    visit ('/sign-up')
    fill_in('user_name', with: 'Avril')
    fill_in('password', with: '123')
    click_button('Sign up')
    expect(page).to have_content 'You have signed up to DreamBnB!'
  end
end
