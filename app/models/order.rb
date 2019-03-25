class Order < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :product
  belongs_to :inventory
  validates :product_id, presence: { message: 'Order must belong to a product' }
  validates :inventory_id, presence: { message: 'Order must belong to an inventory' }

  def self.search(product_id, sku, user_id)
    # blank? covers both nil and empty string
    if product_id.present?
      # select * from orders where product_id in (select id from products where user_id = user.id and id = product_id);
      where(product_id: Product.where(user_id: user_id, id: product_id))
    elsif sku.present?
      # select * from orders where product_id in (select id from products where user_id = user.id) and
      # inventory_id in (select product_id from inventories where sku = sku) ;
      where(product_id: Product.where(user_id: user_id), inventory_id: Inventory.where(sku: sku))
    end
  end
end
