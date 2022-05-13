class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :postal_code, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :building, null: false
      t.string :tell , null: false
      t.integer :prefecture_id, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
