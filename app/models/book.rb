class Book < ActiveRecord::Base
  monetize :price_cents

  scope :by_times_purchased, -> { order(times_purchased: :asc) }

  scope :by_published_date, -> { order(published_date: :desc) } 
  
end
