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
    @feed = resource
    @stories = @feed.stories.eager_load(:users).order(published: :desc).page(params[:page])
    @start_color = start_color
    @end_color = end_color
  end

  def index
    @feeds = current_user.feeds.page(params[:page])
  end

  # NONCRUD

  def follow
    feed = Feed.find(params[:feed_id])
    feed.toggle_follow!(current_user)
    render plain: feed.reload.follow_action(current_user)
  end

  def refresh
    feed = Feed.find(params[:feed_id])
    feed.async_fetch if feed.fetched_at < 2.minutes.ago
    redirect_to feed
  end

  private

  def feed_params
    params.require(:feed).permit(:url)
  end

  def resource
    Feed.find(params[:id])
  end
end
