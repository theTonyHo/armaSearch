class Drawing < ActiveRecord::Base

    # interpolate in paperclip
    Paperclip.interpolates :subdirs do |attachment, style|
      project = Project.find(attachment.instance.project_id)
      user = User.find(project.user_id)
      user.email
      "#{user.email}/#{project.id}"
    end

  belongs_to :project
  belongs_to :part
  has_attached_file :attachment,
    :storage => :s3,
    :url => ":s3_domain_url",
    :path => "/drawings/attachments/:subdirs/:id/:filename"
  validates :name, presence: true, length: { minimum: 4 }, uniqueness: true
  validates :attachment, presence: true
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

end
