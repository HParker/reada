# frozen_string_literal: true
# == Schema Information
#
# Table name: stories
#
#  id               :uuid             not null, primary key
#  title            :text
#  content          :text
#  author           :string
#  summary          :string
#  links            :text
#  url              :string
#  entry_id         :text
#  updated          :datetime
#  published        :datetime
#  enclosure_url    :string
#  enclosure_length :string
#  enclosure_type   :string
#  itunes_author    :string
#  itunes_image     :string
#  itunes_duration  :string
#  itunes_summary   :string
#  itunes_subtitle  :string
#  itunes_explicit  :string
#  feed_id          :uuid
#  permalink        :string
#  read             :boolean          default(FALSE), not null
#  starred          :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_stories_on_feed_id  (feed_id)
#

class Story < ApplicationRecord
  has_many :marks
  has_many :users, through: :marks
  belongs_to :feed

  validates :entry_id, uniqueness: true

  def self.from_xml(entry, feed)
    create_params = entry.to_h.select do |key, _value|
      allowed_params.include?(key)
    end
    feed.stories
      .find_or_initialize_by(entry_id: entry.entry_id)
      .assign_attributes(process_params(create_params))
    feed
  end

  def marked?(user)
    marks.where(user_id: user.id).any?
  end

  def author
    read_attribute(:author) || read_attribute(:itunes_author)
  end

  def self.process_params(create_params)
    create_params.each_with_object({}) do |(key, val), hash|
      hash[key] =
        if val.respond_to?(:join)
          val.join("\n")
        else
          val
        end
    end
  end
  private_class_method :process_params

  def self.allowed_params
    new.attributes.keys
  end
  private_class_method :allowed_params
end
