require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(LocName: 'newLocation'))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /newLocation/
  end
end
