# encoding: UTF-8

class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = Common.find_or_create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def failure
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Come back soon!'
  end
end
