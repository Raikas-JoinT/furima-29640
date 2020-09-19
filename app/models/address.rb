class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :addresses_item
  belongs_to_active_hash :prefecture
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 }
end
