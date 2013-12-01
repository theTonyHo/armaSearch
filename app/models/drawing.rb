class Drawing < ActiveRecord::Base
  has_attached_file :attachment
  
  extend FriendlyId
  friendly_id :name, use: :slugged

end
