
class Product < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :user
  has_many :orders
  has_many :inventories
  validates :user_id, presence: { message: 'The product must belong to a user'}

  #def available?
  #  inventory.quantity > 0
  #end
  #
  enum product_type: { accessories: 1, clothing: 0 }

  def self.search(pattern, user_id)
    # blank? covers both nil and empty string
    # TODO: never return data if we dont have user_id
    if pattern.blank?
      where(arel_table[:user_id].eq(user_id))
    else
      where(arel_table[:name].lower.matches("%#{pattern}%".downcase).and(arel_table[:user_id].eq(user_id)))
    end
  end

end
