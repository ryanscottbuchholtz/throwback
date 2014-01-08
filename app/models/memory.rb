class Memory < ActiveRecord::Base

  belongs_to :category,
    inverse_of: :memories
end