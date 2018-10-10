# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  user_id    :uuid
#  feed_id    :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_follows_on_feed_id  (feed_id)
#  index_follows_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe 'it exists' do
    it { expect { FactoryBot.create(:follow) }.not_to raise_error }
  end
end
