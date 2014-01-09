class Memory < ActiveRecord::Base
  validates_presence_of :user_id, :question_id

  belongs_to :question,
    inverse_of: :memories

  belongs_to :user,
    inverse_of: :memories
end