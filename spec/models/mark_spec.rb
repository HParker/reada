# frozen_string_literal: true

# == Schema Information
#
# Table name: marks
#
#  id         :integer          not null, primary key
#  user_id    :uuid
#  story_id   :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_marks_on_story_id  (story_id)
#  index_marks_on_user_id   (user_id)
#

require 'rails_helper'

RSpec.describe Mark, type: :model do
  describe 'it exists' do
    it { expect { FactoryBot.create(:mark) }.not_to raise_error }
  end
end
