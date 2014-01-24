require 'spec_helper'

describe Memory do
  describe 'validations' do
    let (:blank) { ['', nil] }

    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:season) }
    it { should validate_presence_of(:year) }

    it { should have_valid(:question).when(Question.new) }
    it { should_not have_valid(:question).when(nil) }

    it { should have_valid(:user).when(User.new) }
    it { should_not have_valid(:user).when(nil) }

    it { should have_valid(:season).when('Fall', 'Summer') }
    it { should_not have_valid(:season).when(*blank) }

    it { should have_valid(:year).when(1976, 1999) }
    it { should_not have_valid(:year).when(19876, *blank) }
  end

  describe 'associations' do

    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end

end


