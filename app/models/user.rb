# frozen_string_literal: true
class User < ApplicationRecord
  has_many :authorizations
  validates :name, :email, presence: true

  def add_provider(auth_hash)
    unless authorizations.find_by(provider: auth_hash.provider, uid: auth_hash.uid)
      authorizations.create!(provider: auth_hash.provider, uid: auth_hash.uid)
    end
  end
end
