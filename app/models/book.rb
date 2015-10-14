class Book < ActiveRecord::Base
  has_many :line_items
  monetize :price_cents
  before_destroy :ensure_not_referenced_by_any_line_item


  scope :filter, -> (search) { where("title LIKE ?", "%#{search}%") } 

  def add_book
    line_item = LineItem.new
  end
 


  private
  #ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

end
