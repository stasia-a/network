module UserHelper
  def find_user(feed_item)
    User.find_by_id(feed_item.sender_id)
  end
end
