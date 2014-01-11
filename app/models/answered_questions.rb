class AnsweredQuestions < ActiveRecord::Base
  validates_presence_of :user_id, :question_id

  has_many :users,
    inverse_of: :answered_question

  has_many :questions,
    inverse_of: :answered_question

end