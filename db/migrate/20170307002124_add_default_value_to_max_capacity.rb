class AddDefaultValueToMaxCapacity < ActiveRecord::Migration[5.0]
  def up
    change_column :locations, :MaxCapacity, :integer, :default => 0
  end

  def down
    change_column :locations, :MaxCapacity, :integer, :default => nil
  end
end
