module SessionsHelper

  def current_user?(user)
    current_user == user
  end

  def signed_in_user
    unless user_signed_in?
      redirect_to root_path, notice: "Please sign up."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
