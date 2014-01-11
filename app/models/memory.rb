class Memory < ActiveRecord::Base
  validates_presence_of :user, :question

  belongs_to :question,
    inverse_of: :memories

  belongs_to :user,
    inverse_of: :memories
    
end