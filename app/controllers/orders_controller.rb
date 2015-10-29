class OrdersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your cart is empty"
      return
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      format.html do 
        if @order.save_with_payment
          Cart.destroy(session[:cart_id])
          session[:cart_id] = nil
          OrderNotifier.received(@order).deliver       
          redirect_to @order, notice: 'Thank you for your order.'
        else
          render action: 'new'
        end
      end
    end
  end

  # PATCH/PUT /orders/1
  def update
    respond_to do |format|
      if @order.update(order_params)
        redirect_to @order, notice: 'Order was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    respond_to do |format|
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :billing_address, :shipping_address,
                                    :email, :pay_type, :stripe_card_token)
    end
end

