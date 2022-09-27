require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '内容に問題がなく購入ができる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase_form).to be_valid
      end
      it '建物名は空でも購入できること' do
        @purchase_form.building = nil
        expect(@purchase_form).to be_valid
      end
    end
    context '内容に問題があり購入ができない場合' do
      it 'user_idが空だと購入できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空だと購入できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Itemを入力してください")
      end
      it '郵便番号が空だと購入できないこと' do
        @purchase_form.postcode = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンがないと購入できないこと' do
        @purchase_form.postcode = 1234567
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("郵便番号はハイフンを含めた半角文字列で入力してください (例：123-4567)")
      end
      it '都道府県が「---」だと購入できないこと' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("都道府県を選択して下さい")
      end
      it '都道府県が空だと購入できないこと' do
        @purchase_form.prefecture_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("都道府県を選択して下さい")
      end
      it '市区町村が空だと購入できないこと' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと購入できないこと' do
        @purchase_form.address = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと購入できないこと' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンがあると購入できないこと' do
        @purchase_form.phone_number = '123 - 1234 - 1234'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("電話番号は半角数字で10桁または11桁で入力してください")
      end
      it '電話番号が9桁以下では購入できない' do
        @purchase_form.phone_number = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("電話番号は半角数字で10桁または11桁で入力してください")
      end
      it '電話番号が12桁以上あると購入できないこと' do
        @purchase_form.phone_number = '123456789101112'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("電話番号は半角数字で10桁または11桁で入力してください")
      end
      it 'トークンが空だと購入できないこと' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end