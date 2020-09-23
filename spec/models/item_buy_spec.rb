require 'rails_helper'
RSpec.describe ItemBuy, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_buy = FactoryBot.build(:item_buy, user_id: buyer.id, item_id: item.id )
  end

  describe 'ユーザーの商品購入' do
    context '商品購入ががうまくいくとき' do
      it "すべての値が正しく入力されていれば購入できる" do
        expect(@item_buy).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空では購入できない" do
        @item_buy.token = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では購入できない" do
        @item_buy.postal_code = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号は前3文字後ろ4文字の間にハイフンを入れなければ購入できない" do
        @item_buy.postal_code = 'ああ'
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Postal code is invalid")
      end
      it "都道府県が空では購入できない" do
        @item_buy.prefecture_id = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空では購入できない" do
        @item_buy.city = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では購入できない" do
        @item_buy.address = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では購入できない" do
        @item_buy.phone_number = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は半角数字でなければ購入できない" do
        @item_buy.phone_number = "ああ"
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Phone number is not a number")
      end
    end
  end
end