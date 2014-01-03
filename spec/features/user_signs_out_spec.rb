require 'spec_helper'

feature 'existing user signs out', %Q{
  As an existing user
  I want to sign out of the application
  So that my privacy is preserved
} do

  # ACCEPTANCE CRITERIA
  # * I must click a sign out link
  # * I am re-directed to the root page

  scenario 'existing user clicks on sign out link(happy path)' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Welcome back to throwback!')
    expect(page).to have_content('Sign Out')

    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully')
    expect(page).to have_content('Sign In')

  end

end