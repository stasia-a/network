class RelationshipsController < ApplicationController
  skip_before_filter :load_user
  skip_before_filter :correct_user
  respond_to :html, :js

  def create
    @user = User.find(params[:relationship][:friend_id])
    current_user.friend!(@user)
    @user.friend!(current_user)
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).friend
    current_user.not_a_friend!(@user)
    @user.not_a_friend!(current_user)
    respond_with @user
  end

end

