FactoryGirl.define do
  factory :contact_request do
    name     { FFaker::Name.name }
    email    { FFaker::Internet.email }
    subject  { FFaker::HipsterIpsum.phrase }
    comment  { FFaker::HipsterIpsum.phrases }
    file     { File.new("#{Rails.root}/spec/fixtures/test.pdf") }
  end
end
