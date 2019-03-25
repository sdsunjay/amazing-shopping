require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :product_id => 1,
      :inventory_id => 1,
      :street_address => "MyString",
      :apartment => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country_code => "MyString",
      :zip => 1,
      :phone_number => "MyString",
      :email => "MyString",
      :name => "MyString",
      :status => "MyString",
      :payment_ref => "MyString",
      :transaction => "MyString",
      :payment_amt_cents => 1,
      :ship_charged_cents => 1,
      :shop_cost_cents => 1,
      :subtotal_cents => 1,
      :total_cents => 1,
      :shipper_name => "MyString",
      :tracking_number => "MyString",
      :tax_total_cents => 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[product_id]"

      assert_select "input[name=?]", "order[inventory_id]"

      assert_select "input[name=?]", "order[street_address]"

      assert_select "input[name=?]", "order[apartment]"

      assert_select "input[name=?]", "order[city]"

      assert_select "input[name=?]", "order[state]"

      assert_select "input[name=?]", "order[country_code]"

      assert_select "input[name=?]", "order[zip]"

      assert_select "input[name=?]", "order[phone_number]"

      assert_select "input[name=?]", "order[email]"

      assert_select "input[name=?]", "order[name]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[payment_ref]"

      assert_select "input[name=?]", "order[transaction]"

      assert_select "input[name=?]", "order[payment_amt_cents]"

      assert_select "input[name=?]", "order[ship_charged_cents]"

      assert_select "input[name=?]", "order[shop_cost_cents]"

      assert_select "input[name=?]", "order[subtotal_cents]"

      assert_select "input[name=?]", "order[total_cents]"

      assert_select "input[name=?]", "order[shipper_name]"

      assert_select "input[name=?]", "order[tracking_number]"

      assert_select "input[name=?]", "order[tax_total_cents]"
    end
  end
end
