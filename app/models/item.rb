class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :title, :text, :category, presence: true
  validates :title, :text, :status, presence: true
  validates :title, :text, :burden, presence: true
  validates :title, :text, :area, presence: true
  validates :title, :text, :day, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
  belongs_to :user
  has_one :addresses_item
  has_one_attached :image
end
