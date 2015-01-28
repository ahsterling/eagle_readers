class BooksController < ApplicationController

  def index
    @books = Book.search(params[:attribute], params[:search])
  end

  def show
    @book = Book.find(params[:id])
  end
end
