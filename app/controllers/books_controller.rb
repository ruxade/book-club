class BooksController < ApplicationController

def index
  if params[:query].present?
    @books = GoogleBooksService.search_books(params[:query])
  else
    # @top_rated_books = @books.order(average_rating: :desc).limit(7) # Fetch top 7 rated books

    @books = [] # No books are loaded until a search is performed
  end
end


  def show
    if params[:google_id].present?
      @book = GoogleBooksService.find_book(params[:google_id])
    else
      redirect_to books_path, alert: "Book not found."
    end
  end





  # GET /books/new
# def new
# @book = Book.new
# end

# def create
#   @book = Book.new(book_params)
#   if @book.save
#     redirect_to books_path, notice: "Book was successfully created."
#   else
#     render :new, status: :unprocessable_entity
#   end
# end

    # GET /books/1



# private
#   def book_params
#     params.require(:book).permit(:title, :cover_url, :overview)
#   end

end
