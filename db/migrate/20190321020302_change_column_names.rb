class ChangeColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :transaction, :transaction_id
    rename_column :orders, :shop_cost_cents, :ship_cost_cents
  end
end
