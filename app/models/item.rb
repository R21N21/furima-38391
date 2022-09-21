class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
#  has_one :item_purchase
#  belongs_to_active_hash :category
#  belongs_to_active_hash :item_condition
#  belongs_to_active_hash :preparation_day
#  belongs_to_active_hash :postage_payer
#  belongs_to_active_hash :prefecture
end
