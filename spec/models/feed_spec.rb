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

require 'spec_helper'

RSpec.describe Feed, type: :model do
  let(:feed_xml) do
    VCR.use_cassette('feedjira') do
      url = 'http://feedjira.com/blog/feed.xml'
      xml = HTTParty.get(url).body
      feed = Feedjira.parse(xml)
      feed.entries.first
    end
  end

  describe '#with_xml' do
    before { subject.with_xml(feed_xml) }
    it { expect(subject.title).to eq('"Feedjira Two-Point-Oh"') }
    it { expect(subject.language).to be_nil }
  end
end
