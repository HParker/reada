# frozen_string_literal: true

module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) || NullUser.new
  end
end
