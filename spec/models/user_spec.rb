require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'lastnameが空では登録できない'do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname can't be blank"
      end
      it 'firstnameが空では登録できない'do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname can't be blank"
      end
      it 'lastname_kanaが空では登録できない'do
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname kana can't be blank", "Lastname kana is invalid. Input full-width katakana characters."
      end
      it 'firstname_kanaが空では登録できない'do
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kana can't be blank", "Firstname kana is invalid. Input full-width katakana characters."
      end
      it 'birthdayが空では登録できない'do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumeric characters.")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumeric characters.")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumeric characters.")
      end
      it 'lastnameに半角文字が含まれていると登録できない' do
        @user.lastname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters.")
      end
      it 'firstnameに半角文字が含まれていると登録できない' do
        @user.firstname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid. Input full-width characters.")
      end
      it 'lastname_kanaが全角カタカナ以外では登録できない' do
        @user.lastname_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid. Input full-width katakana characters.")
      end
      it 'firstname_kanaが全角カタカナ以外では登録できない' do
        @user.firstname_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters.")
      end
    end
  end
end
