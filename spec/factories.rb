# frozen_string_literal: true

FactoryBot.define do
  factory :mark do
    user
    story
  end
  factory :follow do
    user
    feed
  end
  factory :user do
    name { 'MyString' }
    email { 'MyString' }
    image_url { 'MyString' }
  end
  factory :authorization do
    provider { 'MyString' }
    uid { 'MyString' }
    user_id { 1 }
  end
  factory :story do
    title { 'MyText' }
    permalink { 'MyText' }
    content { 'MyText' }
    feed_id { 1 }
    published { '2016-11-25 08:32:05' }
    read { false }
    starred { false }
    feed
  end
  factory :group do
    name { 'MyString' }
  end
  factory :feed do
    title { 'MyString' }
    url { 'MyText' }
    last_fetched { '2016-11-25 08:27:20' }
    status { 0 }
    group_id { 1 }
  end
end
