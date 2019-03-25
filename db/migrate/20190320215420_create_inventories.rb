class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.string :color
      t.string :size
      t.integer :weight, :limit => 2
      t.integer :price_cents
      t.integer :sale_price_cents
      t.integer :cost_cents
      t.string :sku
      t.integer :length, :limit => 2
      t.integer :width, :limit => 2
      t.integer :height, :limit => 2
      t.string :note

      t.timestamps
    end
  end
end
