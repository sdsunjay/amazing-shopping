require 'rails_helper'

RSpec.describe "inventories/index", type: :view do
  before(:each) do
    assign(:inventories, [
      Inventory.create!(
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
      ),
      Inventory.create!(
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
      )
    ])
  end

  it "renders a list of inventories" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
