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
      # where(arel_table[:product_id].eq(product_id))
      where(product_id: Product.where(user_id: user_id, id: product_id))
    elsif sku.present?
      where(product_id: Product.where(user_id: user_id), sku: sku)
    else
      where(product_id: Product.where(user_id: user_id))
    end
  end
end
