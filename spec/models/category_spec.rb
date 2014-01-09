require 'spec_helper'

describe Category do
  describe 'validations' do
    let (:blank) { ['', nil] }

    it { should have_valid(:name).when('Love', 'Home') }
    it { should_not have_valid(:name).when(*blank) }
  end

  describe 'associations' do

    it { should have_many(:questions) }
  end
end
