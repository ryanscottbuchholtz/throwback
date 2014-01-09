class Memory < ActiveRecord::Base

  belongs_to :category,
    inverse_of: :memories

  belongs_to :user,
    inverse_of: :memories
end