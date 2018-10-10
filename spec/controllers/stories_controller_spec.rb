# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  describe 'GET #show' do
    it 'returns http success' do
      story = FactoryBot.create(:story)
      get :show, params: { id: story.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
