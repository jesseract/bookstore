class BooksController < ApplicationController
  before_filter :authenticate_user!

  def index
    sort = params[:sort] || "published_date desc"
    @books = Book.filter(params[:search])
      .order(sort)
      .page(params[:page])
  end
end





