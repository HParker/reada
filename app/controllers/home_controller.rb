# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @casts = current_user.feeds.page(params[:page])
  end
end
