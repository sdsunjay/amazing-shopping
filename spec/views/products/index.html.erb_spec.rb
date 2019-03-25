require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :description => "MyText",
        :style => "Style",
        :brand => "Brand",
        :url => "Url",
        :type => 2,
        :shipping_price => "9.99",
        :note => "Note",
        :user_id => 3
      ),
      Product.create!(
        :name => "Name",
        :description => "MyText",
        :style => "Style",
        :brand => "Brand",
        :url => "Url",
        :type => 2,
        :shipping_price => "9.99",
        :note => "Note",
        :user_id => 3
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Style".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
