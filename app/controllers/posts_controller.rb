class PostsController < ApplicationController
  skip_before_filter :correct_user, except: [:destroy]

  respond_to :html, :js

  def create
    @post = @user.post!(params[:post][:content], current_user)
    @feed_items = @user.posts.paginate(page: params[:page])
    respond_with(@user)
  end

  def destroy 
    @post.destroy
    @feed_items = @user.posts.paginate(page: params[:page])
    respond_with @user
  end

  private

  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to user_path(current_user) if @post.nil?
  end  
end
