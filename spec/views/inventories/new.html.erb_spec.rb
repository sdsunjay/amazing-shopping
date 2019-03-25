require 'rails_helper'

RSpec.describe "inventories/new", type: :view do
  before(:each) do
    assign(:inventory, Inventory.new(
      :product_id => 1,
      :quantity => 1,
      :color => "MyString",
      :size => "MyString",
      :weight => 1,
      :price_cents => 1,
      :sale_price_cents => 1,
      :cost_cents => 1,
      :sku => "MyString",
      :length => 1,
      :width => 1,
      :height => 1,
      :note => "MyString"
    ))
  end

  it "renders new inventory form" do
    render

    assert_select "form[action=?][method=?]", inventories_path, "post" do

      assert_select "input[name=?]", "inventory[product_id]"

      assert_select "input[name=?]", "inventory[quantity]"

      assert_select "input[name=?]", "inventory[color]"

      assert_select "input[name=?]", "inventory[size]"

      assert_select "input[name=?]", "inventory[weight]"

      assert_select "input[name=?]", "inventory[price_cents]"

      assert_select "input[name=?]", "inventory[sale_price_cents]"

      assert_select "input[name=?]", "inventory[cost_cents]"

      assert_select "input[name=?]", "inventory[sku]"

      assert_select "input[name=?]", "inventory[length]"

      assert_select "input[name=?]", "inventory[width]"

      assert_select "input[name=?]", "inventory[height]"

      assert_select "input[name=?]", "inventory[note]"
    end
  end
end
