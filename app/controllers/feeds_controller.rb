# frozen_string_literal: true
class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      redirect_to feeds_path
    else
      render :new
    end
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def index
    @feeds = Feed.all
  end

  private

  def feed_params
    params.require(:feed).permit(:url)
  end
end
