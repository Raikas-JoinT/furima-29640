class UserAddress

  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture, :city, :address, :building_name, :phone_number

end