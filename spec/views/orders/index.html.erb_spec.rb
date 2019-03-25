require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :product_id => 2,
        :inventory_id => 3,
        :street_address => "Street Address",
        :apartment => "Apartment",
        :city => "City",
        :state => "State",
        :country_code => "Country Code",
        :zip => 4,
        :phone_number => "Phone Number",
        :email => "Email",
        :name => "Name",
        :status => "Status",
        :payment_ref => "Payment Ref",
        :transaction => "Transaction",
        :payment_amt_cents => 5,
        :ship_charged_cents => 6,
        :shop_cost_cents => 7,
        :subtotal_cents => 8,
        :total_cents => 9,
        :shipper_name => "Shipper Name",
        :tracking_number => "Tracking Number",
        :tax_total_cents => 10
      ),
      Order.create!(
        :product_id => 2,
        :inventory_id => 3,
        :street_address => "Street Address",
        :apartment => "Apartment",
        :city => "City",
        :state => "State",
        :country_code => "Country Code",
        :zip => 4,
        :phone_number => "Phone Number",
        :email => "Email",
        :name => "Name",
        :status => "Status",
        :payment_ref => "Payment Ref",
        :transaction => "Transaction",
        :payment_amt_cents => 5,
        :ship_charged_cents => 6,
        :shop_cost_cents => 7,
        :subtotal_cents => 8,
        :total_cents => 9,
        :shipper_name => "Shipper Name",
        :tracking_number => "Tracking Number",
        :tax_total_cents => 10
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "Apartment".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Ref".to_s, :count => 2
    assert_select "tr>td", :text => "Transaction".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => "Shipper Name".to_s, :count => 2
    assert_select "tr>td", :text => "Tracking Number".to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
  end
end
