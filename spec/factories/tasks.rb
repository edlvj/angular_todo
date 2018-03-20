FactoryGirl.define do
  factory :task do
    title 'new task'
    priority 1
  end
  
  trait :with_comments do
    comments { create_list :comment, 1 }
  end
end
