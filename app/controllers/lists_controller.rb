class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists.includes(:books)
  end

  def show
    @list = current_user.lists.find(params[:id])
    @books = @list.books  # Fetch books associated with the list
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to lists_path, notice: "List created successfully!"
    else
      flash.now[:alert] = "Error creating list. Please try again."
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
