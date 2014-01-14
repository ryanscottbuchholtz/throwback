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
    click_link('Get Started Today')
    fill_in 'user[first_name]', with: 'Ryan'
    fill_in 'user_last_name', with: 'Buchholtz'
    fill_in 'Your E-mail', with: 'ryanscottbuchholtz@gmail.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    select 'September', from: "user[birth_month]"
    select 25, from: "user[birth_day]"
    select 1976, from: "user[birth_year]"

    click_button ('Create my Account')

    expect(page).to have_content("Time to throwback!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link('Get Started Today')
    click_button ('Create my Account')

    expect(page).to have_content("Please review the problems below")
    expect(page).to_not have_content('Sign Out')
  end 

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_button('signup'['class'])

    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'anotherpassword'
    click_button ('Create my Account')

    expect(page).to have_content("Please review the problems below")
    expect(page).to_not have_content("Sign Out")
  end

end
