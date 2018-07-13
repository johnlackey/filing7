class Category < ApplicationRecord
  self.primary_key = 'CatId'
  has_many :items, class_name: 'Item',
                   foreign_key: 'CatId',
                   primary_key: CatId,
                   inverse_of:  :category
end
