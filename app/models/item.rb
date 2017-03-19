class Item < ActiveRecord::Base
  belongs_to :location, class_name: 'Location',
                        foreign_key: 'LocId'
end
