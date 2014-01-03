# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    password 'password'
    password_confirmation 'password'
    first_name 'Ryan'
    last_name 'Buchholtz'
    birth_month 'September'
    birth_day 25
    birth_year 1976
    gender 'Male'
  end
end
