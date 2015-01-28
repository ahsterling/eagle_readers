class BooksController < ApplicationController

  def index
    @books = Book.search(params[:search])
  end

  def show
    @book = Book.find(params[:id])
  end
end
