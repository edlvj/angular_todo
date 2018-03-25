FactoryGirl.define do
  factory :comment do
    title 'test_comment'
    task
  end

  trait :with_text_attachment do
    attachment  { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/test.txt") }
  end

  trait :with_img_attachment do
    attachment  { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/test.png", "image/png") }
  end
end
