require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(ItemName: 'newItemC'))
    assign(:items, [
      Item.create!(ItemName: 'newItem1'),
      Item.create!(ItemName: 'newItem2')
    ])
  end

  it "renders a list of items" do
    render
  end
end
