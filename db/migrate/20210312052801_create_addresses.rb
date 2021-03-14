class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string :telephone, null: false
      t.string :post_num, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :house_num, null: false
      t.string :building
      t.references :buy, null: false, forign_key: true

      t.timestamps
    end
  end
end
