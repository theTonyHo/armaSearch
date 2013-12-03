class Part < ActiveRecord::Base
  has_one :drawing
  belongs_to :project
  belongs_to :assembly_id, :class_name => "Part"
  validates :name, presence: true, length: { minimum: 4 }, uniqueness: true
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
