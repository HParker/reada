# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #create' do
    let(:twitter_auth_hash) do
      OmniAuth::AuthHash.new(
        provider: 'twitter',
        uid: '123545',
        info: {
          name: 'fake',
          email: 'fake@example.com',
          image: 'fake.png'
        }
      )
    end

    it 'can find an existing user' do
      user = FactoryGirl.create(:user)
      request.env['omniauth.auth'] = twitter_auth_hash

      get :create, session: { user_id: user.id }
      expect(response).to have_http_status(:redirect)
    end

    it 'will create a user from an auth hash' do
      request.env['omniauth.auth'] = twitter_auth_hash

      get :create
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy
      expect(response).to have_http_status(:redirect)
      expect(flash[:success]).to be_present
    end
  end
end
