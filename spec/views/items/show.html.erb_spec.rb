require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(ItemName: 'newItem'))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /newItem/
  end
end
