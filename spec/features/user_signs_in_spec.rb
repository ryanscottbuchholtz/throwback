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
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Welcome back to throwback!')
    expect(page).to have_content('Sign Out')
  end


  scenario 'non-existant email/password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'new@user.com'
    fill_in 'Password', with: 'newpassword'
    click_button 'Sign In'

    expect(page).to_not have_content('Welcome back to throwback!')
    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Oops! That E-mail Address was not found.')
  end

  scenario 'existing email, wrong password is denied access' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'incorrectpassword'
    click_button 'Sign In'

    expect(page).to_not have_content('Welcome back to throwback!')
    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Oops! Invalid password.  Please try again.')
  end

  scenario 'already authenticated user cannot re-log in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign In')

    visit new_user_session_path

    expect(page).to have_content('You are already signed in.')

  end

end




