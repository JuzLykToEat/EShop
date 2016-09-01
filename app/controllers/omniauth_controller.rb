class OmniauthController < ApplicationController
  def create
    user_fb = User.from_omniauth(request.env["omniauth.auth"])
    session[:id] = user_fb.id
    redirect_to root_url
  end

  def destroy
    session[:id] = nil
    redirect_to root_url
  end
end
