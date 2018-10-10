# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
      redirect_to root_path
    else
      auth = Authorization.from_auth_hash(auth_hash)
      session[:user_id] = auth.user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have been logged out'
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
