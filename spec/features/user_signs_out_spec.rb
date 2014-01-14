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
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Time to throwback')
    expect(page).to have_content('Sign Out')

    click_link 'Sign Out'

    expect(page).to have_content('Get Started Today')
    expect(page).to have_content('Home')

  end

end