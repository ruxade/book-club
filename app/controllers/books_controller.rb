class BooksController < ApplicationController
  def index
    @books = Book.all
  end


  # Only allow a list of trusted parameters through.
  def garden_params
  params.require(:garden).permit(:name, :banner_url)
  end

end
