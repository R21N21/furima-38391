class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,            null: false
      t.text       :item_description,     null: false
      t.string     :item_price,           null: false
      t.references :user,                 null: false, foreign_key: true
      t.integer    :category_id,          null: false
      t.integer    :item_condition_id,    null: false
      t.integer    :preparation_day_id,   null: false
      t.integer    :postage_payer_id,     null: false
      t.integer    :prefecture_id,        null: false
      t.timestamps
    end
  end
end
