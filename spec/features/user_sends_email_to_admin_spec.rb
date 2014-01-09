require 'spec_helper'

feature 'non-existing user sends email to site admin', %q{

  As a site visitor
  I want to contact the site's staff
  So that I can ask questions or make comments about the site
} do

  # ACCEPTANCE CRITERIA
  # * I must specify a valid email address
  # * I must specify a subject
  # * I must specify a description
  # * I must specify a first name
  # * I must specify a last name

  scenario 'non-registered user visits site and sends email to admin(happy path)' do
    ActionMailer::Base.deliveries = []

    visit root_path
    click_link 'Contact Us'

  end
end

