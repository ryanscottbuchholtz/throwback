require 'spec_helper'

feature 'authenticated user selects a memory to write', %Q{
  As an existing user
  I want to select a memory by category
  So I can capture that specifc memory in the app
} do

  # ACCEPTANCE CRITERIA
  # * User signs in
  # * User is re-directed to dashboard
  # * User is presented with category options
  # * User clicks 'Travel' category
  # * User is presented with a question and form to complete memory
  # * User completes memory
  # * User clicks save
  # * User is redirected to dashboard

  scenario 'existing user clicks on Travel' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)

    visit root_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Sign In'

    save_and_open_page
    expect(page).to have_content('Time to throwback')
    expect(page).to have_content('Sign Out')
    click_link 'Travel'
   
  end

end