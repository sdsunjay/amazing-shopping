require 'rails_helper'

RSpec.describe "inventories/show", type: :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!(
      :product_id => 2,
      :quantity => 3,
      :color => "Color",
      :size => "Size",
      :weight => 4,
      :price_cents => 5,
      :sale_price_cents => 6,
      :cost_cents => 7,
      :sku => "Sku",
      :length => 8,
      :width => 9,
      :height => 10,
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/Note/)
  end
end
