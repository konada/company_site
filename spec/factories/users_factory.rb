FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    created_at Time.now
    password 'password1111'

    trait :admin do
      admin true
    end
  end
end
