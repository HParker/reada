# frozen_string_literal: true
class Story < ApplicationRecord
  belongs_to :feed

  def self.from_xml(entry, feed)
    create_params = entry.to_h.select do |key, _value|
      new.attributes.keys.include?(key)
    end
    feed.stories.new(create_params)
  end
end
