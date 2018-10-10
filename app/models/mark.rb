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

class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :story
end
