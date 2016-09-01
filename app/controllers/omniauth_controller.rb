class OmniauthController < ApplicationController
  def create
    user_fb = User.from_omniauth(request.env["omniauth.auth"])

    if user_fb
      session[:id] = user_fb.id
      flash[:success] = "Welcome back #{current_user.username}"
      redirect_to root_path
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_url
  end
end
