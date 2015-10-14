class CartsController < InheritedResources::Base
  skip_before_action :authorize, only: :update

  def update
    cart = Cart.new(user_id: current_user.id)
    #find a book by book_id 
    book = Book.find(cart_params[:book_id])
    #choose a book, click the 'add to cart' button
    #create a cart, associate it with a user, 
    #get the book id for the item, add the book to the cart, update number of things in cart
  end

  private

    def cart_params
      params.require(:cart).permit(:book_id, :user_id, :cart_id)
    end
end

