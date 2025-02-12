class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  # Action to create a review
  def create
    @review = @book.reviews.new(review_params)
    @review.user = current_user # Assign the review to the current user

    if @review.save
      redirect_to @book, notice: 'Review was successfully created.'
    else
      redirect_to @book, alert: 'Unable to create review.'
    end
  end

  def destroy
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to @book, notice: 'Review was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end


  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
