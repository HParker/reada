# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Authorization, type: :model do
  describe '.from_auth_hash' do
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

    it 'finds and returns an existing authorization' do
      FactoryGirl.create(
        :authorization,
        provider: 'twitter',
        uid: '123545',
        user: FactoryGirl.create(:user)
      )
      expect { described_class.from_auth_hash(twitter_auth_hash) }.to change(User, :count).by(0)
    end

    it 'creates a new user if it does not exist' do
      expect { described_class.from_auth_hash(twitter_auth_hash) }.to change(User, :count).by(1)
    end
  end
end
