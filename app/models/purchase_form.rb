class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode,       format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id,     numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number,   format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :token
  end

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    PurchaseInformation.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end