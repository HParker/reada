# frozen_string_literal: true
class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end
end
