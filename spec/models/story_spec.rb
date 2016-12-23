# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Story, type: :model do
  let(:feed_xml) do
    VCR.use_cassette('feedjira') do
      url = 'http://feedjira.com/blog/feed.xml'
      Feedjira::Feed.fetch_and_parse(url).entries.first
    end
  end

  let(:feed) do
    VCR.use_cassette('getafeedjira') do
      FactoryGirl.create(:feed, url: 'http://feedjira.com/blog/feed.xml')
    end
  end

  describe '.from_xml' do
    subject { described_class.from_xml(feed_xml, feed).stories.first }
    it { expect(subject.title).to eq('Feedjira Two-Point-Oh') }
    it { expect(subject.links).to eq('http://feedjira.com/blog/2015/06/05/feedjira-two-point-oh.html') }
  end
end
