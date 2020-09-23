FactoryBot.define do
  factory :item_buy do
    postal_code {"123-4567"}
    prefecture_id {2}
    city {"ああアア山田"}
    address {"ああアア山田1"}
    building_name {"ああアア山田1"}
    phone_number {"09085738573"}
    association :user
    association :item
  end
end
