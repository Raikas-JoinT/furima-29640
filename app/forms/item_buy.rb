class ItemBuy

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, numericality: {with: /\A[0-9]+\z/}
  end

  def save
    item_save = AddressesItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, addresses_item_id: item_save.id)
  end

end