require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品ができるとき' do
      it '全ての情報が正しく打ち込まれていると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it '商品画像が添付されていなければ登録されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空の場合登録されない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空の場合登録されない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'カテゴリーが空の場合登録されない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空の場合登録されない' do
        @item.item_condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it '配送料の負担が空の場合登録されない' do
        @item.postage_payer = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end

      it '発送元が空の場合登録されない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空の場合登録されない' do
        @item.preparation_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end

      it '価格が空の場合登録されない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank", "Item price is invalid")
      end

      it '価格は半角数値で入力されていない場合登録できない' do
        @item.item_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end

      it '価格が300円以下の場合登録されない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it '価格が9999999円以上の場合登録されない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
    end
  end
end
