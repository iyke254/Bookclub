class ReviewsController < ApplicationController
	def new
		@book = Book.find(params[:book_id])
		@review = @book.reviews.new
	end

	def create
      @book = Book.find(params[:book_id])
      @review = @book.reviews.new(review_params)
      if @review.save
        redirect_to book_path(@review.book)
      else
        render :new
      end
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
   
 end

def update
   @book = Book.find(params[:book_id])
   @review = @book.reviews.find(params[:id])
   if @review.update(review_params)
     flash[:notice] = "Review successfully updated!"
     redirect_to book_path(@book)
   else
     render :edit
   end
 end

def destroy
   @book = Book.find(params[:book_id])
   @review = @book.reviews.find(params[:id])
   @review.destroy
   flash[:notice] = "Review successfully deleted!"
   redirect_to book_path(@book)
 end

  private
    def review_params
      params.require(:review).permit(:description)
    end

end		