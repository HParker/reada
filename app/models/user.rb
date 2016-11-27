# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  email      :string           not null
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :authorizations
  validates :name, :email, presence: true

  def add_provider(auth_hash)
    unless authorizations.find_by(provider: auth_hash.provider, uid: auth_hash.uid)
      authorizations.create!(provider: auth_hash.provider, uid: auth_hash.uid)
    end
  end
end
