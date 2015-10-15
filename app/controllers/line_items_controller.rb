class LineItemsController < InheritedResources::Base
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def create
    book = Book.find(params[:line_item] [:book_id])
    @line_item = @cart.add_book(book.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
      else
        format.html {render action: 'new' }
      end
    end
  end

  private

    def line_item_params
      params.require(:line_item).permit(:book_id, :cart_id)
    end
end

