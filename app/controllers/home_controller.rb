# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @stories = Story.joins(:feed).order(published: :desc).all
  end
end
