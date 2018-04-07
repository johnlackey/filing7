class AddDefaultValueToViewable < ActiveRecord::Migration[5.0]
  def up
    change_column :locations, :Viewable, :boolean, :default => true
  end

  def down
    change_column :locations, :Viewable, :boolean, :default => nil
  end
end
