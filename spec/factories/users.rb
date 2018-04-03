require 'date'

FactoryGirl.define do
  factory :user do
    username { FFaker::Internet.user_name }
    password { FFaker::Internet.password(8, 8) }
    password_confirmation { password }
    uid { username }
  end

  trait :confirmed do
    confirmed_at { Date.today }
  end
end
