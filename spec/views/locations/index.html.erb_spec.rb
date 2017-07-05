require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(LocName: 'newLocationC'))
    assign(:locations, [
      Location.create!(LocName: 'newLocation1'),
      Location.create!(LocName: 'newLocation2')
    ])
  end

  it "renders a list of locations" do
    render
    expect(rendered).to match /Name/
    expect(rendered).to match /Description/
    expect(rendered).to match /Capacity/
    expect(rendered).to match /Items/
    expect(rendered).to match /Review Frequency/
  end
end
