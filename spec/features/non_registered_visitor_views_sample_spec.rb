require 'spec_helper'

feature 'A site visitor views sample', %Q{
  As a visitor
  I want to see a sample
  So that I can decide if I want to sign up
} do 

  # ACCEPTANCE CRITERIA
  # * I visit mythrowback root and click on Sample
  # * I see a static sample exercise

  scenario 'click on Sample Link and see sample (happy path)' do
    visit root_path
    click_link('Example')

    expect(page).to have_content("Write Memory")
    expect(page).to have_content("enter e-mail")
  end

end