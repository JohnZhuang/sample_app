class Micropost < ActiveRecord::Base
  attr_accessible :title, :description, :location, :start, :end, :goal, :pledged, :backers, :user_id
  validates :user_id, presence: true
end