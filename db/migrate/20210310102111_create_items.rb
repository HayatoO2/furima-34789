class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.integer :category_id, null: false
      t.integer :status_id, null:false
      t.integer :pay_id, null:false
      t.integer :prefecture_id, null:false
      t.integer :delivery_date_id, null: false

      t.timestamps
    end
  end
end
