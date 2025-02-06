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
      redirect_to @list, notice: 'List created successfully'
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: 'List deleted successfully'
  end

  
  private

  def list_params
    params.require(:list).permit(:name)
  end
end
