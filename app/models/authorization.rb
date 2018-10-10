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

class Authorization < ApplicationRecord
  belongs_to :user
  validates :provider, :uid, presence: true
  validates :user, presence: true

  def self.from_auth_hash(auth_hash)
    auth = find_by(provider: auth_hash.provider, uid: auth_hash.uid)
    unless auth
      user = User.new(name: auth_hash.info.name,
                      email: auth_hash.info.email,
                      image_url: auth_hash.info.image)
      auth = user.authorizations.build(provider: auth_hash.provider,
                                       uid: auth_hash.uid)
      user.save!
    end
    auth
  end
end
