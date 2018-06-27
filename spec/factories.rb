FactoryBot.define do
  factory :user do
    email 'foo@gmail.com'
    password '123456'
  end

  factory :city do
    name 'Москва'
    latitude 55.753215
    longitude 37.622504
  end
end
