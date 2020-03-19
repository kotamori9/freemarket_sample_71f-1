class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user, foreign_key: true
      t.integer :brand, foreign_key: true
      t.integer :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false
      t.string :status, null: false
      t.string :price, null: false
      t.string :shipping_charges, null: false
      t.string :days_to_ship, null: false
      t.timestamps
    end
  end
end
