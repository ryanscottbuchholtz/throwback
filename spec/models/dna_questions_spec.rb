require 'spec_helper'

describe DnaQuestion do

  describe 'validations' do

    it { should have_valid(:user).when(User.new) }
    it { should_not have_valid(:user).when(nil) }

    it { should have_valid(:question).when(Question.new) }
    it { should_not have_valid(:question).when(nil) }

    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:question) }

  end

  describe 'associations' do

    it { should belong_to(:user) }
    it { should belong_to(:question) }

  end

end
