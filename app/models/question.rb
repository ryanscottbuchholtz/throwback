class Question < ActiveRecord::Base
  validates_presence_of :category_id

  belongs_to :category,
    inverse_of: :questions

  has_many :memories,
    inverse_of: :question

  has_many :answered_questions,
    inverse_of: :question
    
end
