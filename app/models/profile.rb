class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :nickname, :education, :status, :avatar

  belongs_to :user

  has_attached_file :avatar, :styles => { :thumb => "100x100#", :to_wall => "40x40#"}, :default_url => "/system/profiles/avatars/default/:style/default.png"
 
  validates :first_name, :last_name, :nickname, :length => { :maximum => 15}
end
