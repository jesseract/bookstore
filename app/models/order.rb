class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = [ "Visa", "MasterCard", "American Express" ] 
  validates :name, :shipping_address, :billing_address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  attr_accessor :stripe_card_token

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
    self.total = cart.total_price
  end

  def save_with_payment
    if valid?
      charge = Stripe::Charge.create(
        :amount => total,
        :currency => "usd",
        :source => stripe_customer_token,
        :description => "Book order"
      )
      self.stripe_token = charge.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end

