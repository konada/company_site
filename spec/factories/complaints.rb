FactoryGirl.define do
    factory :complaint, class: ComplaintForm do
      name { FFaker::Name.name }
      product { FFaker::Product.product }
      email { FFaker::Internet.email }
      body { FFaker::Lorem.phrase }
    end
  end
