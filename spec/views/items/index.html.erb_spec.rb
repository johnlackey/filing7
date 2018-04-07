require 'rails_helper'

RSpec.describe "items/index", type: :view do
  fixtures :all

  before(:each) do
    @location = locations(:location_one)
    @item = assign(:item, Item.create!(ItemName: 'newItemC', location: @location, NumItemId: 1, TextItemId: '1', ReviewFreq: 1, IsTagged: 0, Status: 1))
    assign(:items, [
      Item.create!(ItemName: 'newItem1', location: @location, NumItemId: 1, TextItemId: '1', ReviewFreq: 1, IsTagged: 0, Status: 1),
      Item.create!(ItemName: 'newItem2', location: @location, NumItemId: 1, TextItemId: '1', ReviewFreq: 1, IsTagged: 0, Status: 1)
    ])
  end

  it "renders a list of items" do
    render
  end
end
