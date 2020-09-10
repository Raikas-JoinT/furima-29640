FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"ああ"}
    last_name {"ああ"}
    first_name_kana {"アア"}
    last_name_kana {"アア"}
  end
end