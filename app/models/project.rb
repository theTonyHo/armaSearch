class Project < ActiveRecord::Base
  has_many :drawings
  has_many :parts

  has_many :project_users
  has_many :users, :through => :project_users
  
  has_one :user
  validates :name, presence: true, length: { minimum: 4 }, uniqueness: true
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
