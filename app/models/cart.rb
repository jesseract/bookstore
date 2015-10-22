class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy


  def add_book(book, quantity)
    current_item = line_items.find_by_book_id(book.id)
    if current_item && quantity > 0
      current_item.quantity += quantity
    else
      current_item = line_items.build(book_id: book.id, quantity: quantity)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end


end
