class Book < ActiveRecord::Base
  monetize :price_cents

  

  scope :by_published_date, -> { order(published_date: :desc) } 
  scope :filter, -> (search) { where("title LIKE ?", "%#{search}%") } 
 
end
