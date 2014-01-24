require 'spec_helper'

feature 'registered user opts out of a question', %q{

  As a user
  I want to skip questions
  So that a new question is presented
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
    click_link 'Skip and get another'

    expect_page.to have_content('Travel')

  end
end