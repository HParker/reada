# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  user_id    :uuid
#  feed_id    :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_feed_id  (feed_id)
#  index_groups_on_user_id  (user_id)
#

require 'spec_helper'

RSpec.describe Group, type: :model do
  describe 'it exists' do
    it { expect { FactoryBot.create(:group) }.not_to raise_error }
  end
end
