class Category < ActiveRecord::Base
  validates_presence_of :name

  has_many :memories,
    inverse_of: :category
end
