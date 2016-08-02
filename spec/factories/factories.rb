FactoryGirl.define do
  factory :item do
    name
    description "Test Description"
    image_url "http://example.com/image.jpg"
  end

  sequence :name do |n|
    "Name #{n}"
  end
end
