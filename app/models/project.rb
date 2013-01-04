class Project < ActiveRecord::Base
  attr_accessible :title, :description, :location, :start, :end, :goal, :pledged, :backers
  belongs_to :user

  validates :title, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  default_scope order: 'projects.created_at DESC'
end
