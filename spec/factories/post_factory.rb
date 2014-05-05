FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    sequence(:body) { |n| "This is post #{n}" }
   
    factory :published_post do
      status { :published }
    end

    factory :draft_post do
      status { :draft }
    end
  end
end