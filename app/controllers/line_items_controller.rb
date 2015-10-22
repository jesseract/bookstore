class LineItemsController < ApplicationController
  include CurrentCart

  before_action :set_cart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def create
    book = Book.find(params[:line_item][:book_id])
    quantity = params[:line_item][:quantity].to_i
    @line_item = @cart.add_book(book, quantity)

    if @line_item.save
      flash[:success] = "You successfully added #{book.title} to your cart!" 
      redirect_to books_path
    else
      flash[:error] = "Invalid quantity"
      redirect_to book_path(book) 
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to edit_cart_path(@cart)
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end

