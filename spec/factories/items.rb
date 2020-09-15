FactoryBot.define do
  factory :item do
    title {"ああアア山田"}
    content {"あア山10"}
    category_id {2}
    status_id {2}
    burden_id {2}
    area_id {2}
    day_id {2}
    price {400}
    association :user
  end
end
