# frozen_string_literal: true
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
