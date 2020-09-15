FactoryBot.define do
  factory :item do
    title {"ああアア山田"}
    content {"ああアア山田"}
    category_id {2}
    status_id {2}
    burden_id {2}
    area_id {2}
    day_id {Date.today}
    price {400}
    association :user
  end
end
