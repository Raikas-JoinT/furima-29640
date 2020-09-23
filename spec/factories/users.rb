FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"aaaa11"}
    password_confirmation {password}
    first_name {"ああ"}
    last_name {"ああ"}
    first_name_kana {"アア"}
    last_name_kana {"アア"}
    birthday {Faker::Date.birthday}
  end
end