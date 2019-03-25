require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/Apartment/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Payment Ref/)
    expect(rendered).to match(/Transaction/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/Shipper Name/)
    expect(rendered).to match(/Tracking Number/)
    expect(rendered).to match(/10/)
  end
end
