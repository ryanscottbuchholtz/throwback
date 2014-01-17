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

    visit root_path
    visit root_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Sign In'

    click_button 'Your Dashboard'
    click_button 'Travel'
    click_button 'Skip Forever'

  end
end