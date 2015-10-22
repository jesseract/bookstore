class BooksController < ApplicationController
  include CurrentCart

  before_filter :authenticate_user!
  before_action :set_cart

  def index
    sort = params[:sort] || "published_date desc"
    @books = Book.filter(params[:search])
      .order(sort)
      .page(params[:page])
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new 
    @book = Book.new
  end

  private

  def book_params
      params.require(:book).permit(:id, :quantity)
    end

end





