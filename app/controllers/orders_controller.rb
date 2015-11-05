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
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.create(params[:id])
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      format.html do 
          render :confirmation
        end
      end
    end

  def confirm_order
    if @order.save_with_payment
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil 
      OrderNotifier.received(@order).deliver       
      redirect_to @order, notice: "Thank you for your order!"
    else
      redirect_to @order, alert: "There was an error with placing your order: #{@order.errors.full_messages.to_sentence}"
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
    
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :billing_address, :shipping_address,
                                    :email, :pay_type, :stripe_card_token)
    end
end

