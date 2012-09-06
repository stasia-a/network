class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:token_authenticatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :profile_attributes
  attr_accessible :photos_attributes
 
  has_one :profile, :dependent => :destroy
  accepts_nested_attributes_for :profile
 
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos
  
  has_many :senders, :through => :posts, :source => :sender
  has_many :posts, :foreign_key => "user_id", :dependent => :destroy
  
  has_many :friends, :through => :relationships, :source => :friend
  has_many :relationships, :foreign_key => "user_id", :dependent => :destroy

  define_index do
    indexes email
    indexes profile.first_name, :as => :profile_first_name
    indexes profile.last_name, :as => :profile_last_name
    indexes profile.nickname, :as => :profile_nickname
    set_property :enable_star => true
    set_property :min_infix_len => 3   
  end

  def friend?(other_user)
    relationships.find_by_friend_id(other_user.id)!=nil
  end

  def friend!(other_user)
    relationships.create!(:friend_id => other_user.id)
  end

  def not_a_friend!(other_user)
    relationships.find_by_friend_id(other_user.id).destroy
  end
 
  def post!(cont,other_user)
    posts.create!(:content => cont,:sender_id => other_user.id)
  end

  def feed
    Post.where("user_id = ?", id)
  end
end
