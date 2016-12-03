# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  user       :uuid
#  feed_id    :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_follows_on_feed_id  (feed_id)
#  index_follows_on_user     (user)
#

class Follow < ApplicationRecord

end
