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

require 'spec_helper'

RSpec.describe Story, type: :model do
  let(:feed_xml) do
    VCR.use_cassette('feedjira') do
      url = 'http://feedjira.com/blog/feed.xml'
      xml = HTTParty.get(url).body
      feed = Feedjira.parse(xml)
      feed.entries.first
    end
  end

  let(:feed) do
    VCR.use_cassette('getafeedjira') do
      FactoryBot.create(:feed, url: 'http://feedjira.com/blog/feed.xml')
    end
  end

  describe '.from_xml' do
    subject { described_class.from_xml(feed_xml, feed).stories.first }
    it { expect(subject.title).to eq('Feedjira Two-Point-Oh') }
    it { expect(subject.links).to eq('http://feedjira.com/blog/2015/06/05/feedjira-two-point-oh.html') }
  end
end
