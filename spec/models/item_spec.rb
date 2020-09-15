require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザーの出品登録' do
    context '出品登録がうまくいくとき' do
      it "titleとcontent、category_idとstatus_id、burden_idとarea_id、day_idとpriceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
      it "titleが40文字以下であれば出品できる" do
        @item.title = "ああ"
        @item.valid?
        expect(@item).to be_valid
      end
      it "contentが1000文字以下であれば出品できる" do
        @item.content = "ああ"
        @item.valid?
        expect(@item).to be_valid
      end
      it "priceが300円以上9999999円以下の半角数字であれば出品できる" do
        @item.price = "400"
        @item.valid?
        expect(@item).to be_valid
      end

    end

    context '出品登録がうまくいかないとき' do
      it "titleが空では出品できない" do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "titleが40文字以上では出品できない" do
        @item.title = "あ" * 60
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
      it "contentが空では出品できない" do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it "contentが1000文字以上では出品できない" do
        @item.content = "あ" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Content is too long (maximum is 1000 characters)")
      end
      it "category_idが空では出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "status_idが空では出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "burden_idが空では出品できない" do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden is not a number")
      end
      it "area_idが空では出品できない" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it "day_idが空では出品できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day is not a number")
      end
      it "priceが300円以下だと出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "priceが9999999円以上だと出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end
