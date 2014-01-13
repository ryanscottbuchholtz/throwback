class Memory < ActiveRecord::Base
  default_scope order: 'memories.year'

  validates_presence_of :user, :question, :year, :season

  belongs_to :question,
    inverse_of: :memories

  belongs_to :user,
    inverse_of: :memories

  validates :question, uniqueness: { :scope => :user }
   
end