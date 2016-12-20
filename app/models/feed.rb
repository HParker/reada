# frozen_string_literal: true
# == Schema Information
#
# Table name: feeds
#
#  id                :uuid             not null, primary key
#  etag              :string
#  url               :string
#  feed_url          :string
#  links             :text
#  title             :string
#  description       :string
#  language          :string
#  itunes_author     :string
#  itunes_image      :string
#  itunes_summary    :string
#  itunes_subtitle   :string
#  itunes_explicit   :string
#  itunes_keywords   :string
#  itunes_owners     :string
#  itunes_categories :string
#  last_fetched      :datetime
#  status            :integer          default("success"), not null
#  group_id          :uuid
#  latest_dump       :text
#  last_modified     :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_feeds_on_group_id  (group_id)
#

require 'uri'

class Feed < ApplicationRecord
  has_many :stories
  has_many :follows

  validates :url, presence: true
  validate :valid_feed
  after_commit :async_fetch, on: :create

  enum status: [:success, :notice, :alert]

  def follow_action(user)
    if following?(user)
      "unfollow"
    else
      "follow"
    end
  end

  def toggle_follow!(user)
    if following?(user)
      follows.find_by(user: user).destroy!
    else
      follows.create!(user: user) if user.persisted?
    end
  end

  def following?(user)
    follows.where(user_id: user.id).any?
  end

  def display_title
    title || URI::parse(url).path
  end

  def display_image
    itunes_image || "placeholder.png"
  end

  def display_modified
    if last_modified
      ActionController::Base.helpers.time_ago_in_words(last_modified)
    else
      "No data yet"
    end
  end

  def with_xml(feed_xml)
    assign_attributes(create_params(feed_xml))
    self
  end

  def async_fetch
    feed = parser.fetch_and_parse(url)
    with_xml(feed)

    feed.entries.each do |entry|
      Story.from_xml(entry, self)
    end
    save!
  end
  handle_asynchronously :async_fetch

  def fetched_at
    last_fetched || 1.year.ago
  end

  private

  def create_params(feed_xml)
    attribute_names = self.class.new.attributes.keys

    create_params = feed_xml.as_json.select do |key, _value|
      attribute_names.include?(key)
    end
    process_params(create_params).merge(latest_dump: feed_xml.to_yaml, last_fetched: Time.now)
  end

  def process_params(create_params)
    create_params.each_with_object({}) do |(key, val), hash|
      hash[key] =
        if val.respond_to?(:to_json)
          val.to_json
        else
          val
        end
    end
  end

  def valid_feed
    return if finder.feed?(url)
    if urls = finder.find(url)
      self.url = urls.first
    else
      errors.add(:url, 'Could not find a feed at that url')
    end
  rescue URI::InvalidURIError, Errno::ENOENT, Errno::ECONNREFUSED
    errors.add(:url, "#{url} was not a valid url")
  end

  def parser
    @parser ||= Feedjira::Feed
  end

  def finder
    @finder ||= Feedbag
  end
end
