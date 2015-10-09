class BooksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @books = Book.order(published_date: :desc).page params[:page], per_page: 25
  end
end
