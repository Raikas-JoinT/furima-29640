class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to :user
  has_one :addresses_item
  has_one_attached :image


  with_options presence: true do
    validates :title
    validates :content
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end

  validates :price, numericality: {with: /\A[0-9]+\z/},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
  greater_than: 300, less_than: 10000000
  }
end
