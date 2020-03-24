class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :user, foreign_key: true
      t.string :brand, foreign_key: true
      t.string :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false
      t.string :status, null: false
      t.integer :price, null: false
      t.string :shipping_charges, null: false
      t.string :days_to_ship, null: false
      t.integer :buyer_id
      t.integer :saler_id
      t.string :area, null: false
      t.timestamps
    end
  end
end
