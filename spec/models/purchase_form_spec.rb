require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '商品購入機能' do
    context '内容に問題がなく保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_form).to be_valid
      end
    end
    context '内容に問題があり保存ができない場合' do
      it 'user_idが空だと保存できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @purchase_form.postcode = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @purchase_form.postcode = 1_234_567
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が「---」だと保存できないこと' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '都道府県が空だと保存できないこと' do
        @purchase_form.prefecture_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_form.address = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input only number")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @purchase_form.phone_number = '123 - 1234 - 1234'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @purchase_form.phone_number = '123456789101112'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'トークンが空だと保存できないこと' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
