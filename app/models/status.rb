# frozen_string_literal: true

class Status < ApplicationRecord
  self.primary_key = 'id'
  has_many :items, class_name: 'Item',
                   foreign_key: 'Status',
                   primary_key: 'id',
                   inverse_of: :status
end
