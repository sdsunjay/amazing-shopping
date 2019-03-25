require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :description => "MyText",
      :style => "Style",
      :brand => "Brand",
      :url => "Url",
      :type => 2,
      :shipping_price => "9.99",
      :note => "Note",
      :user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Style/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Note/)
    expect(rendered).to match(/3/)
  end
end
