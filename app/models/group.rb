class Group < ActiveRecord::Base
  has_many :users
  has_many :toilets

  validates :name, presence: true, uniqueness: true
end
