require 'spec_helper'

feature 'existing user updates profile', %Q{
  As an existing user
  I want to update my profile
  So that my timeline is more robust and throwback questions are more specific
} do

  # ACCEPTANCE CRITERIA
  # * User clicks on 'My Profile' link
  # * User is re-directed to a profile update page
  # * User is presented with fields that may be updated or changed
  # * User clicks 'Update Profile' and changes are persisted if valid
  # * Invalid input throws error messages and is not saved until valid

  scenario 'existing user clicks on Update Profile link' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link('sign in', match: :first)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'sign in'

    expect(page).to have_content('Welcome back to throwback!')
    expect(page).to have_content('sign out')

    click_link 'my profile'

    expect(page).to have_content('profile updated')
   
  end

end