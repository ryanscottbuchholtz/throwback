class Memory < ActiveRecord::Base
  validates_presence_of :body, :user, :question, :year, :season

  validates :year, numericality: { greater_than: 1900, less_than: 2015}

  belongs_to :question,
    inverse_of: :memories

  belongs_to :user,
    inverse_of: :memories

  validates :question, uniqueness: { scope: :user }

  default_scope order: 'memories.year DESC'
  scope :year, lambda{|year| where('year = ?', year)}
  scope :category, lambda{|category| where('category = ?', category)}
  scope :season, lambda{|season| where('season = ?', season)}
  
end