class UsersController < ApplicationController

  before_filter :admin_user, only: :destroy
  skip_before_filter :load_user
  skip_before_filter :correct_user, only: :destroy

  def show
    @user = User.find(params[:id])
    @title = "My home page"
    @feed_items = @user.feed.paginate(page: params[:page])
  end

  def index
    @users = User.search params[:search], :page => params[:page], :per_page => 10
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end


  def friends
    @user = User.find(params[:id])
    @title = "My friends"
    @users = @user.friends.paginate(page: params[:page])
    render 'show_friends' 
  end

    private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
