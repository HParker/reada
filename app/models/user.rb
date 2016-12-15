# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  email      :string           not null
#  image_url  :string
#  admin      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :authorizations
  has_many :follows
  has_many :marks
  has_many :feeds, through: :follows
  has_many :stories, through: :feeds
  validates :name, :email, presence: true

  def add_provider(auth_hash)
    unless authorizations.find_by(provider: auth_hash.provider, uid: auth_hash.uid)
      authorizations.create!(provider: auth_hash.provider, uid: auth_hash.uid)
    end
  end
end
