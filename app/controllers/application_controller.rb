class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_user
  before_filter :authenticate_user!
  before_filter :correct_user,   only: [:edit, :update, :destroy]
  private

  def load_user
    @user=User.find_by_id(params[:user_id])
  end

  def current_user?(user)
      current_user == user
  end

  def correct_user
    redirect_to user_path(user) unless current_user?(@user)
  end

end
