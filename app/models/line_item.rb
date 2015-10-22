class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :cart
  validates :quantity, inclusion: { in: (1..100) }

  def total_price
    book.price * quantity
  end
end
