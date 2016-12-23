# frozen_string_literal: true
require 'spec_helper'

RSpec.describe NullUser, type: :model do
  let(:null_user) { NullUser.new }
  describe '#id' do
    subject { null_user.id }
    it { is_expected.to be_nil }
  end

  describe '#name' do
    subject { null_user.name }
    it { is_expected.to eq('') }
  end

  describe '#image_url' do
    subject { null_user.image_url }
    it { is_expected.to eq('') }
  end

  describe '#persisted?' do
    subject { null_user.persisted? }
    it { is_expected.to be false }
  end

  describe '#feeds' do
    subject { null_user.feeds }
    it { is_expected.to eq(Feed.all) }
  end

  describe '#stories' do
    subject { null_user.stories }
    it { is_expected.to eq(Story.all) }
  end
end
