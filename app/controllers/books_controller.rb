class BooksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @books = Book.order(published_date: :desc)
  end
end
