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
    @list = Book.find(params[:list_id])
    @review = @list.reviews.find(params[:id])
   
 end

def update
   @list = Book.find(params[:list_id])
   @review = @list.reviews.find(params[:id])
   if @review.update(review_params)
     flash[:notice] = "Task successfully updated!"
     redirect_to list_path(@list)
   else
     render :edit
   end
 end

def destroy
   @list = Book.find(params[:list_id])
   @review = @list.reviews.find(params[:id])
   @review.destroy
   flash[:notice] = "Review successfully deleted!"
   redirect_to list_path(@list)
 end

  private
    def review_params
      params.require(:review).permit(:description)
    end

end		