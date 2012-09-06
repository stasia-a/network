class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    @title = "Home"
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end
end
