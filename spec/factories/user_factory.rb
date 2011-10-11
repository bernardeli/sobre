FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    username 'rogerwaters'
    name 'Roger Waters'
    email
    password 'abc12345'
  end
end
