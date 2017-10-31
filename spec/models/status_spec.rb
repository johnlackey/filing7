require 'rails_helper'

RSpec.describe Status, type: :model do
  it "contains the standard values" do
    statuses = Status.all
    expect(statuses.count).to eq(4)
    expect(statuses[0].name).to eq('Open')
    expect(statuses[1].name).to eq('Occupied')
    expect(statuses[2].name).to eq('Move Out Pending')
    expect(statuses[3].name).to eq('Move In Pending')
  end
end
