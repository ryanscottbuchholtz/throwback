class Question < ActiveRecord::Base
  validates_presence_of :category_id
  
  has_many :memories,
    inverse_of: :question

  has_many :users,
    through: :memories

  belongs_to :category,
    inverse_of: :questions
    
end
