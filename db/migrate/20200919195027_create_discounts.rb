class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.integer :discount
      t.integer :item_quantity

      t.timestamps
    end
  end
end
