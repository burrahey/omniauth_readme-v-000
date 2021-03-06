class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_auth_hash(auth)
    session[:user_id] = @user.id
    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
