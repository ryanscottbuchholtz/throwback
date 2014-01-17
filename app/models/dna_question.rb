class DnaQuestion < ActiveRecord::Base
  validates_presence_of :user, :question

  belongs_to :user,
    inverse_of: :dna_questions

  belongs_to :question,
    inverse_of: :dna_questions

end