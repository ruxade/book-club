class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
    # @lists = current_user.lists.includes(:books)
  end

  def show
    @list = current_user.lists.find(params[:id])
    @books = @list.books  # Fetch books associated with the list
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to lists_path, notice: 'List created successfully'
    else
      Rails.logger.debug "List errors: #{@list.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to @list, notice: 'List updated successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: 'List deleted successfully'
  end


  def add_book
    list = current_user.lists.find(params[:list_id])
    book_params = params.require(:book).permit(:google_id, :title, :cover_url, :overview)

    @book = Book.find_or_create_by(google_id: book_params[:google_id]) do |book|
      book.title = book_params[:title]
      book.cover_url = book_params[:cover_url]
      book.overview = book_params[:overview]
    end

    if list.books.exists?(@book.id)
      flash[:alert] = "Book already exists in the list."
    else
      list.books << @book
      flash[:notice] = "Book added successfully!"
    end

    redirect_to list_path(list)
  end


  private

  def list_params
    params.require(:list).permit(:name)
  end
end
