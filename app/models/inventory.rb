class Inventory < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :product
  validates :product_id, presence: { message: 'Inventory must belong to a product' }

  def available?
    quantity > 0
  end

  def self.search(product_id, sku, user_id)
    # blank? covers both nil and empty string
    if product_id.present?
      joins(:product).where(Product.arel_table[:user_id].eq(user_id).and(Product.arel_table[:id].eq(product_id)))
      # where(product_id: Product.where(user_id: user_id, id: product_id))
    elsif sku.present?
      joins(:product).where(Product.arel_table[:user_id].eq(user_id).and(Inventory.arel_table[:sku].eq(sku)))
      # where(product_id: Product.where(user_id: user_id), sku: sku)
    elsif user_id.present?
      joins(:product).where(Product.arel_table[:user_id].eq(user_id))
      # where(product_id: Product.where(user_id: user_id))
    end
  end
end
