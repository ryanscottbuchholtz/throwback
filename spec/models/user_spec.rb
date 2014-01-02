require 'spec_helper'

describe User do
  describe 'validations' do
    let (:blank) { [nil, ''] }

    it { should have_valid(:first_name).when('Ryan') }
    it { should_not have_valid(:first_name).when(*blank) }

    it { should have_valid(:last_name).when('Buchholtz') }
    it { should_not have_valid(:last_name).when(*blank) }

    it { should have_valid(:email).when('ryan@buchholtz.com') }
    it { should_not have_valid(:email).when(*blank, 'ryan@buchholtz', 'ryan.com', 'ryan', 'ryan@com') }

    it { should have_valid(:birth_month).when('September') }
    it { should_not have_valid(:birth_month).when(*blank) }

    it { should have_valid(:birth_day).when(25) }
    it { should_not have_valid(:birth_day).when(*blank) }

    it { should have_valid(:birth_year).when(1976) }
    it { should_not have_valid(:birth_year).when(*blank) }

    it { should have_valid(:gender).when('Male') }
    it { should_not have_valid(:gender).when(*blank) }
  end

  it 'has a matching password confirmation for the password' do

    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

end
