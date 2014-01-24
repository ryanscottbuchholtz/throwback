require 'spec_helper'

describe Question do
  describe 'validations' do

    let(:blank) { ['', nil] }

    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:category) }

    it { should have_valid(:question).when("This is a question") }
    it { should_not have_valid(:question).when(*blank) }

    it { should have_valid(:category).when(Category.new) }
    it { should_not have_valid(:category).when(nil) }

  end

  describe 'associations' do

    it { should belong_to(:category) }
    it { should have_many(:users) }
    it { should have_many(:memories) }
    it { should have_many(:dna_questions) }

  end

end
