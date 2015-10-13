class Book < ActiveRecord::Base
  monetize :price_cents

  scope :filter, -> (search) { where("title LIKE ?", "%#{search}%") } 
 
end
