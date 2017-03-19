require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(LocName: 'itemLocation'))
    @item = assign(:item, Item.create!(ItemName: 'newItem', LocId: @location))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do
    end
  end
end
