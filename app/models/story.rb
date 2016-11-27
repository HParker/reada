# frozen_string_literal: true
class Story < ApplicationRecord
  belongs_to :feed

  def self.from_xml(entry, feed)
    create_params = entry.to_h.select do |key, _value|
      allowed_params.include?(key)
    end
    feed.stories.new(process_params(create_params))
    feed
  end

  def self.process_params(create_params)
    create_params.each_with_object({}) do |(key, val), hash|
      hash[key] = Array(val).join("\n") if val
    end
  end
  private_class_method :process_params

  def self.allowed_params
    new.attributes.keys
  end
  private_class_method :allowed_params
end
