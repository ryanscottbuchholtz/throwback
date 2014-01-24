require 'spec_helper'

feature 'registered user opts out of a question forever', %q{

  As a user
  I want to skip questions forever
  So that they are never presented to me again
} do

  # ACCEPTANCE CRITERIA
  # * User is authenticated
  # * User clicks Skip Forever
  # * User is re-directed to the question dashboard
  # * New DNA question record is created
  let(:user) {FactoryGirl.create(:user)}

  scenario 'user clicks do not ask again(happy path)' do
    category = FactoryGirl.create(:category)

    visit root_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Sign In'

    click_link 'Travel'
    click_link 'Skip Forever'

    expect_page.to have_content('Please confirm')

    click_link 'Skip Forever'

    expect_page.to have_content('Time to throwback')

  end
end