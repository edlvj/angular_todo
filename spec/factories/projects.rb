FactoryGirl.define do
  factory :project do
    title FFaker::Music.artist
    user
  end
  
    trait :with_tasks do
      tasks { create_list(:task, 2) }
    end
end
