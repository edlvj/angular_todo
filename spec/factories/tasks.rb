FactoryGirl.define do
  factory :task do
    title FFaker::Product.product_name
    priority 1
  end
  
  trait :with_comments do
    comments { create_list :comment, 1 }
  end
end
