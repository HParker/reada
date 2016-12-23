# frozen_string_literal: true
class ExploreController < ApplicationController
  def index
    @casts = Feed.page(params[:page])
  end

  def show; end
end
