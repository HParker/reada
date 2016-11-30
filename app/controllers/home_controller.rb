# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @casts = Feed.page(params[:page])
  end
end
