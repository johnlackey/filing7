class Location < ApplicationRecord
  self.primary_key = 'LocId'
  has_many :items, class_name: 'Item',
                   foreign_key: 'LocId',
                   primary_key: LocId,
                   inverse_of:  :location
end
