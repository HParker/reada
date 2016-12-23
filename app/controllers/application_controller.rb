# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= (User.find_by(id: session[:user_id]) || NullUser.new)
  end

  protected

  def start_color
    to_rgb_string(colors.first, alpha: 0.9)
  end

  def end_color
    to_rgb_string(colors.last)
  end

  def colors
    # calculate colors on save in the model
    @colors ||=
      if resource.itunes_image
        Miro::DominantColors.new(resource.itunes_image).to_rgb
      else
        [[174, 147, 74], [0, 128, 128]]
      end
  end

  def to_rgb_string(color, alpha: 0.4)
    "rgba(#{color[0]},#{color[1]},#{color[2]}, #{alpha})"
  end
end
