FactoryGirl.define do
  factory :user do
    email { 'abc123@abc.com' }
    password { 'loldicks' }
    password_confirmation { 'loldicks' }
  end
end