require 'spec_helper'

feature 'authenticated user selects a memory to write', %Q{
  As an existing user
  I want to select a memory by category
  So I can capture that specifc memory in the app
} do

  # ACCEPTANCE CRITERIA
  # * User signs in
  # * User is re-directed to dashboard
  # * User is presented with a sidebar of category options
  # * User clicks 'Elementary School' category
  # * User is presented with a list of memoir options that they haven't completed before

  scenario 'existing user clicks on Elementary School' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link('sign in', match: :first)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'sign in'

    expect(page).to have_content('Welcome back to throwback!')
    expect(page).to have_content('sign out')

    click_link 'elementary school'

    expect(page).to have_content('elementary school')
   
  end

end