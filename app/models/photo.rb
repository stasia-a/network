class Photo < ActiveRecord::Base
  attr_accessible :comments, :title, :avatar

  belongs_to :user

  has_attached_file :avatar, :styles => { :thumb => "100x100>", :to_wall => "40x40" }

  validates :avatar, :attachment_presence => true
end
