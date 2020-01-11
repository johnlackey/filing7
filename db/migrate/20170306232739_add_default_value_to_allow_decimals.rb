# frozen_string_literal: true

class AddDefaultValueToAllowDecimals < ActiveRecord::Migration[5.0]
  def up
    change_column :locations, :AllowDecimals, :boolean, default: true
  end

  def down
    change_column :locations, :AllowDecimals, :boolean, default: nil
  end
end
