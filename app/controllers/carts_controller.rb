class CartsController < InheritedResources::Base
  skip_before_action :authorize, only: :update

  # def update
  #   cart = Cart.new(user_id: current_user.id)
  #   #find a book by book_id 
  #   book = Book.find(cart_params[:book_id])
  #   #choose a book, click the 'add to cart' button
  #   #create a cart, associate it with a user, 
  #   #get the book id for the item, add the book to the cart, update number of things in cart
  #   #

  def update
    cart = Cart.new(user_id: current_user.id)
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to store_url, notice: 'Your cart is currently empty' }
    end
  end

  private

    def cart_params
      params.require(:cart).permit(:book_id, :user_id, :cart_id)
    end
end

