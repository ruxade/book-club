class ListBooksController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated

  def index
    # Fetch the list based on the ID from the URL parameters
    @list = current_user.lists.find(params[:list_id])
    @list_books = @list.books # Get all books in the list
  end

  def create
    # Fetch the list from the URL parameter
    @list = current_user.lists.find(params[:list_id])

    # Find the book by its ID (assuming it is passed as a parameter)
    @book = Book.find(params[:book_id])

    # Add the book to the list
    @list.books << @book unless @list.books.include?(@book)

    redirect_to list_list_books_path(@list), notice: "Book added to list"
  end

  def destroy
    # Fetch the list from the URL parameter
    @list = current_user.lists.find(params[:list_id])

    # Find the book to be removed from the list
    @book = @list.books.find(params[:id])

    # Remove the book from the list
    @list.books.delete(@book)

    redirect_to list_list_books_path(@list), notice: "Book removed from list"
  end
end
