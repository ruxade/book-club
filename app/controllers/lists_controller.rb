class ListsController < ApplicationController
  before_action :authenticate_user!  # only logged-in users can manage lists

  def index
    @lists = current_user.lists
  end

  def show
    @list = current_user.lists.find(params[:id])
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to lists_path, notice: "List created successfully!"
    else
      render :new
    end
  end

  def add_book
    @list = current_user.lists.find(params[:list_id])
    book = @list.list_books.find_or_create_by(book_id: params[:book_id]) do |b|
      b.title = params[:title]
      b.author = params[:author]
      b.cover_url = params[:cover_url]
    end

    if book.persisted?
      redirect_to @list, notice: "Book added to list!"
    else
      redirect_to @list, alert: "Error adding book."
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
