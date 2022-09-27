class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :items
    has_many :item_purchases


  with_options presence: true do
    validates :nickname 
    validates :birthday
    validates :lastname, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角文字で入力してください"}
    validates :firstname, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角文字で入力してください"}
    validates :lastname_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナで入力してください"}
    validates :firstname_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "は全角カタカナで入力してください"}
  end
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字で入力してください"}
end
