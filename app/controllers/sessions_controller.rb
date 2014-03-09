class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to url_for(controller: :players, action: :lobby, id: user.id)
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_player_path
  end
end
