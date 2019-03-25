class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.references :inventory, foreign_key: true
      t.string :street_address
      t.string :apartment
      t.string :city
      t.string :state
      t.string :country_code
      t.integer :zip, :limit => 3
      t.string :phone_number
      t.string :email
      t.string :name
      t.string :status
      t.string :payment_ref
      t.string :transaction
      t.integer :payment_amt_cents
      t.integer :ship_charged_cents
      t.integer :shop_cost_cents
      t.integer :subtotal_cents
      t.integer :total_cents
      t.string :shipper_name
      t.datetime :payment_date
      t.datetime :shipped_date
      t.string :tracking_number
      t.integer :tax_total_cents

      t.timestamps
    end
  end
end
