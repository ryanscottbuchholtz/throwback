require 'spec_helper'

feature 'A new user signs up with Throwback', %Q{
  As a new user
  I want to supply credentials
  So that I can begin to build my Throwback timeline
} do 

  # ACCEPTANCE CRITERIA
  # * I must provide my first name
  # * I must provide my last name
  # * I must provide my email address
  # * I must provide my birthday
  # * I must provide my gender
  # * I must provide a password
  # * I must provide a matching password confirmation
  # * I am logged in and directed to the profile page

  scenario 'specify valid and required information (happy path)' do
    visit root_path
    click_link('sign up', match: :first)
    fill_in 'first name', with: 'Ryan'
    fill_in 'last name', with: 'Buchholtz'
    fill_in 'e-mail address', with: 'ryanscottbuchholtz@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_button 'sign up'

    expect(page).to have_content("Welcome to throwback!")
    expect(page).to have_content("Let's begin building your profile")
    expect(page).to have_content("sign out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link('sign up', match: :first)
    click_button 'sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end 

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link('sign up', match: :first)

    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'anotherpassword'
    click_button 'sign up'

    expect(page).to have_content("Please review the problems below")
    expect(page).to_not have_content("sign out")
  end

end
