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
    click_link 'Sign Up Today!'
    fill_in 'First Name', with: 'Ryan'
    fill_in 'Last Name', with: 'Buchholtz'
    fill_in 'E-mail Address', with: 'ryanscottbuchholtz@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    select  'September', from: 'Month'
    select 25, from: 'Day'
    select 1976, from: 'Year'
    select 'Male', from: 'Gender'

    click_button 'Sign Up'

    expect(page).to have_content("Welcome to throwback!")
    expect(page).to have_content("Let's begin building your profile")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up Today!'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end 

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up Today!'

    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'anotherpassword'
    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end

end
