require 'spec_helper'

feature 'existing user signs in', %Q{
  As an existing user
  I want to provide my email address and password
  So that I can access my Throwback timeline
} do

  # ACCEPTANCE CRITERIA
  # * I must provide a valid e-mail address
  # * I must provide my password
  # * If email or password is invalid, I remain signed out
  # * If I am already signed in, I can't sign in again
  # * I am directed to my throwback timeline

  scenario 'existing user specifies valid and required information (happy path)' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link('sign in', match: :first)
    fill_in 'user_email', with: user.email
    fill_in 'password', with: user.password
    click_button 'sign in'

    expect(page).to have_content('Welcome back to throwback!')
    expect(page).to have_content('sign out')
  end


  scenario 'non-existant email/password is supplied' do
    visit root_path
    click_link('sign in', match: :first)
    fill_in 'user_email', with: 'new@user.com'
    fill_in 'user_password', with: 'newpassword'
    click_button 'sign in'

    expect(page).to_not have_content('Welcome back to throwback!')
    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Oops! That E-mail Address was not found.')
  end

  scenario 'existing email, wrong password is denied access' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link('sign in', match: :first)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'incorrectpassword'
    click_button 'sign in'

    expect(page).to_not have_content('Welcome back to throwback!')
    expect(page).to_not have_content('sign out')
    expect(page).to have_content('Oops! Invalid password.  Please try again.')
  end

  scenario 'already authenticated user cannot re-log in' do
    user = FactoryGirl.create(:user)
    
    visit new_user_session_path
    
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'sign in'

    expect(page).to have_content('sign out')
    expect(page).to_not have_content('sign in')

    visit new_user_session_path

    expect(page).to have_content('You are already signed in.')

  end

end




