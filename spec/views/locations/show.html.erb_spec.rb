require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    @category_blank = assign(:category, Category.create!(CatName: '', Viewable: 1))
    @category = assign(:category, Category.create!(CatName: 'newCategory', Viewable: 1))
    @location = assign(:location, Location.create!(LocName: 'newLocation'))
    @item_one = assign(:item, Item.create!(
        NumItemId: 1,
        TextItemId: '1',
        ItemName: 'item1',
        location: @location,
        Keywords: 'several keywords for the first item',
        category: @category,
        ActionDate: 3.days.from_now,
        IsTagged: 0,
        ReviewFreq: 30,
        Status: 1
    ))
    @item_two = assign(:item, Item.create!(
        NumItemId: 2,
        TextItemId: '2',
        ItemName: 'item2',
        location: @location,
        Keywords: 'several keywords for the second item',
        category: @category,
        IsTagged: 0,
        ReviewFreq: 30,
        Status: 1
    ))
    @item_three = assign(:item, Item.create!(
        NumItemId: 3,
        TextItemId: '3',
        ItemName: '',
        location: @location,
        Keywords: '',
        category: @category_blank,
        IsTagged: 0,
        ReviewFreq: 30,
        Status: 0
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /newLocation/
    expect(rendered).to match /Item/
    expect(rendered).to match /Item Name/
    expect(rendered).to match /Keywords/
    expect(rendered).to match /Category/
    expect(rendered).to match /Action Date/
    expect(rendered).to match /Status/
    expect(rendered).to match /1/
    expect(rendered).to match /item1/
    expect(rendered).to match /several keywords for the first item/
    expect(rendered).to match /newCategory/
    expect(rendered).to match /Occupied/
    expect(rendered).to match /Open/
    expect(rendered).not_to match /UTC/
  end
end
