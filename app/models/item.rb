class Item < ActiveRecord::Base
  self.primary_key = 'RecordId'
  belongs_to :location, class_name: 'Location',
                        foreign_key: 'LocId',
                        primary_key: 'LocId'
  def getLocation
    return Location.find(self.LocId)
  end
end
