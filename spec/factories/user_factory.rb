FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :username do |n|
    "rogerwaters#{n}"
  end

  factory :user do
    username
    email
    password 'abc12345'
    password_confirmation 'abc12345'
  end
end
