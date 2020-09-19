class ItemBuy

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :building_name
    validates :phone_number, numericality: {with: /\A[0-9]+\z/}
  end

  validates :prefecture, numericality: { other_than: 1 }

  def save
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number)
    Addresses_item.create(user_id: user.id, item_id: item.id)
  end

end