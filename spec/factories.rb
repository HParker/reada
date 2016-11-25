FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    image_url "MyString"
  end
  factory :authorization do
    provider "MyString"
    uid "MyString"
    user_id 1
  end
  factory :story do
    title "MyText"
    permalink "MyText"
    body "MyText"
    feed_id 1
    published "2016-11-25 08:32:05"
    read false
    starred false
  end
  factory :group do
    name "MyString"
  end
  factory :feed do
    name "MyString"
    url "MyText"
    last_fetched "2016-11-25 08:27:20"
    status 1
    group_id 1
  end
end
