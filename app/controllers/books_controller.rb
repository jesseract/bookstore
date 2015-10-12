class BooksController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:sort] == "by_times_purchased"
      @books = Book.by_times_purchased.page params[:page]
    else
      @books = Book.by_published_date.page params[:page]
    end
  end
end
