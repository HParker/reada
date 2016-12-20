# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Feed, type: :model do
  let(:feed_xml) {
    VCR.use_cassette("feedjira") do
      url = 'http://feedjira.com/blog/feed.xml'
      Feedjira::Feed.fetch_and_parse url
    end
  }

  describe '#with_xml' do
    before { subject.with_xml(feed_xml) }
    it { expect(subject.etag).to eq('"393e-53e4757c9db00-gzip"') }
    it { expect(subject.title).to eq('"Feedjira Blog"') }
    it { expect(subject.language).to be_nil }
  end
end
