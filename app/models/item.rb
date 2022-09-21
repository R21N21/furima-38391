class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :image
#  has_one :item_purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :preparation_day
  belongs_to :postage_payer
  belongs_to :prefecture

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to: 9999999, message: "is invalid"}
    validates :image
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :item_condition_id
    validates :preparation_day_id
    validates :postage_payer_id
    validates :prefecture_id
  end
end
