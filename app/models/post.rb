class Post < ActiveRecord::Base
  attr_accessible :content, :sender_id

  belongs_to :user
  belongs_to :sender, class_name: "User"

  validates :content, :presence => true, :length => { :maximum => 200 }
  validates :user_id, presence: true
  validates :sender_id, presence: true

  default_scope :order => 'posts.created_at DESC'
end
