class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode,       format: { with: /\A\d{3}[-]\d{4}\z/, message: "はハイフンを含めた半角文字列で入力してください (例：123-4567)"}
    validates :prefecture_id,     numericality: { other_than: 1, message: 'を選択して下さい' }
    validates :city
    validates :address
    validates :phone_number,   format: { with: /\A\d{10,11}\z/, message: "は半角数字で10桁または11桁で入力してください" }
    validates :token
  end

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    PurchaseInformation.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end