FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'test1234'
    password_confirmation 'test1234'
    first_name 'Shart'
    last_name 'Leakoff'
  end

end
