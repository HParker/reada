# frozen_string_literal: true
class StoriesController < ApplicationController
  def show
    @story = Story.find(params[:id])
    @start_color = start_color
    @end_color = end_color
  end

  def index
    @stories = Story.includes(:feed).order(published: :desc).page params[:page]
  end

  private

  def resource
    Story.find(params[:id])
  end
end
