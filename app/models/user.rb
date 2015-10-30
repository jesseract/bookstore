class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :orders
  attr_accessor :stripe_card_token

  def cart
    orders.where(stripe_token: nil).first_or_create
  end

  def save_card
    if valid?
      customer = Stripe::Customer.create(
        :email => 'example@stripe.com',
        :card => params[:stripeToken]
      )
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
