class Location < ActiveRecord::Base
  has_many :items, class_name: 'Item',
                   foreign_key: 'LocId'
end
