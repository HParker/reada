# frozen_string_literal: true
class StoriesController < ApplicationController
  def show
    @story = Story.find(params[:id])
  end

  def index
  end
end
