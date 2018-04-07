class Item < ActiveRecord::Base
  self.primary_key = 'RecordId'
  belongs_to :location, class_name: 'Location',
             foreign_key: 'LocId',
             primary_key: 'LocId',
             inverse_of:  :items
  belongs_to :category, class_name: 'Category',
             foreign_key: 'CatId',
             primary_key: 'CatId',
             inverse_of:  :items
  belongs_to :status, class_name: 'Status',
             foreign_key: 'Status',
             primary_key: 'id',
             inverse_of:  :items

  #def getLocation
  #  return Location.find(self.LocId)
  #end

  #def getCategory
  #  return Category.find(self.CatId)
  #end

  def review_freq_string
    self.ReviewFreq.to_s + ' days'
  end
end
