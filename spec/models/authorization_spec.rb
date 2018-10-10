# frozen_string_literal: true

# == Schema Information
#
# Table name: authorizations
#
#  id         :uuid             not null, primary key
#  provider   :string           not null
#  uid        :string           not null
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authorizations_on_user_id  (user_id)
#

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
      FactoryBot.create(
        :authorization,
        provider: 'twitter',
        uid: '123545',
        user: FactoryBot.create(:user)
      )
      expect { described_class.from_auth_hash(twitter_auth_hash) }.to change(User, :count).by(0)
    end

    it 'creates a new user if it does not exist' do
      expect { described_class.from_auth_hash(twitter_auth_hash) }.to change(User, :count).by(1)
    end
  end
end
