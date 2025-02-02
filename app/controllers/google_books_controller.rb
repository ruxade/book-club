class GoogleBooksController < ApplicationController
  def search
    books = GoogleBooksService.search_books(params[:query])
    render json: books
  end
end
