class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :orders

  before_create :save_to_stripe

  def cart
    orders.where(stripe_token: nil).first_or_create
  end

  def save_to_stripe
    if valid?
      customer = Stripe::Customer.create(email:  email)
      self.stripe_customer_token = customer.id
    end
  end
end
