class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id,                   null: false
      t.string :destination_name,           null: false
      t.string :destination_name_furigana,  null: false
      t.string :postal_code,                null: false
      t.string :prefecture,                 null: false
      t.string :city,                       null: false
      t.string :address_number,             null: false
      t.string :any_address_info
      t.timestamps
    end
  end
end


