class CartsController < InheritedResources::Base
  skip_before_action :authorize, only: :update

  def update
    @cart = Cart.find(params[:id])
    respond_to do |format|
      if @cart.id == session[:cart_id] && @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to books_path, notice: 'Your cart is currently empty' }
    end
  end

  private

    def cart_params
      params.require(:cart).permit(:book_id, :user_id, :cart_id, :quantity)
    end
end

