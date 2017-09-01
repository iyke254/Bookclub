class ReviewsController < ApplicationController
	def new
		@book = Book.find(params[:book_id])
		@review = @book.reviews.new
	end

	 def create
      @book = List.find(params[:book_id])
      @review = @book.reviews.new(review_params)
      if @review.save
        redirect_to book_path(@review.book)
      else
        render :new
      end
    end

  private
    def review_params
      params.require(:review).permit(:description)
    end

end		