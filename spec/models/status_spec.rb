require 'rails_helper'

RSpec.describe Status, type: :model do
  it "contains the standard values" do
    statuses = Status.all
    expect(statuses).to eq('')
  end
end
