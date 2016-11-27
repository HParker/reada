# frozen_string_literal: true
require 'uri'

class Feed < ApplicationRecord
  has_many :stories

  validates :url, presence: true
  validate :valid_feed
  after_commit :async_fetch, on: :create

  def with_xml(feed_xml)
    create_params = feed_xml.as_json.select do |key, _value|
      self.class.new.attributes.keys.include?(key)
    end
    assign_attributes(create_params)
  end

  STATUS = { success: 0, notice: 1, alert: 2 }.freeze

  def status
    # TODO: default this field
    STATUS.key(read_attribute(:status)) || 'success'
  end

  private

  def async_fetch
    feed = parser.fetch_and_parse(url)
    with_xml(feed)

    feed.entries.each do |entry|
      Story.from_xml(entry, self)
    end
    save!
  end
  handle_asynchronously :async_fetch

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
