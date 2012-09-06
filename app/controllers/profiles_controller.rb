class ProfilesController < ApplicationController

  def new
    @user.build_profile()
  end

  def show
    @profile = @user.profile
  end

  def edit
    @profile = @user.profile
  end

  def update
    if @user.profile.update_attributes(params[:profile])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
 
    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
