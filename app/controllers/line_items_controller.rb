class LineItemsController < ApplicationController
  include CurrentCart

  before_action :set_cart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def create
    book = Book.find(params[:line_item][:book_id])
    quantity = params[:line_item][:quantity].to_i
    if quantity <= 0
      quantity = 1
    end 
    @line_item = @cart.add_book(book, quantity)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
      else
        format.html {render action: 'new' }
      end
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

    def line_item_params
      params.require(:line_item).permit(:book_id, :cart_id, :quantity)
    end
end

