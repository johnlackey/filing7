require 'rails_helper'

RSpec.describe "items/show", type: :view do
  fixtures :all

  before(:each) do
    @location = locations(:location_one)
    @item = assign(:item, Item.create!(ItemName: 'newItem', location: @location, NumItemId: 1, TextItemId: '1', ReviewFreq: 1, IsTagged: 0, Status: 1))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /newItem/
  end
end
