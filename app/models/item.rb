class Item < ApplicationRecord

  belongs_to :user
  has_one :addresses_item
end
