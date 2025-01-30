class BooksController < ApplicationController
  def index
    # GET /books
    @books = Book.all
  end

  # GET /books/new
def new
@book = Book.new
end

def create
  @book = Book.new(book_params)
  if @book.save
    redirect_to books_path, notice: "Book was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
end

    # GET /books/1
  def show
    # @plants = @garden.plants
    # @plant = Book.new
  end


private
  def book_params
    params.require(:book).permit(:title, :cover_url, :overview)
  end

end
