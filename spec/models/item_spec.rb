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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空の場合登録されない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明が空の場合登録されない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーが空の場合登録されない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択して下さい")
      end

      it '商品の状態が空の場合登録されない' do
        @item.item_condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択して下さい")
      end

      it '配送料の負担が空の場合登録されない' do
        @item.postage_payer = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択して下さい")
      end

      it '発送元が空の場合登録されない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択して下さい")
      end

      it '発送までの日数が空の場合登録されない' do
        @item.preparation_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択して下さい")
      end

      it '価格が空の場合登録されない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it '価格は半角数値で入力されていない場合登録できない' do
        @item.item_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it '価格が300円以下の場合登録されない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it '価格が9999999円以上の場合登録されない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択して下さい")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択して下さい")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択して下さい")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択して下さい")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択して下さい")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
