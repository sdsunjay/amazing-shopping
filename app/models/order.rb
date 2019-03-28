class Order < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :product
  belongs_to :inventory
  validates :product_id, presence: { message: 'Order must belong to a product' }
  validates :inventory_id, presence: { message: 'Order must belong to an inventory' }

  def self.search(product_id, sku, user_id)
    # blank? covers both nil and empty string
    if product_id.present?
      joins(:product).where(Product.arel_table[:user_id].eq(user_id).and(Product.arel_table[:id].eq(product_id)))
      # where(product_id: Product.where(user_id: user_id, id: product_id))
    elsif sku.present?
      joins(:product, :inventory).where(Product.arel_table[:user_id].eq(user_id).and(Inventory.arel_table[:sku].eq(sku)))
      # where(product_id: Product.where(user_id: user_id), inventory_id: Inventory.where(sku: sku))
    elsif user_id.present?
      joins(:product).where(Product.arel_table[:user_id].eq(user_id))
    end
  end
end
