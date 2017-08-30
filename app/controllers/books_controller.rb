class BooksController < ApplicationController
	def new
		@books = Book.new
	end	

	def index
		@books = Book.all
	end

	def show
		@books = Book.find(params[:id])
	end	

	def create
		@books = Book.new(book_params)
		if @books.save
			redirect_to books_path
		else
			render :new
		end	
	end

	def edit
		@books = Book.find(params[:id])
	end	

	def update
		@books= Book.find(params[:id])
      	if @books.update(book_params)
 
      		redirect_to books_path
      	else
      		render :edit
      	end	
    end 

    def destroy
    	@books = Book.find(params[:id])
    	@books.destroy
    	redirect_to bookss_path
    end				

	private
		def book_params
			params.require(:books).permit(:name)
		end			

end	

	
		
	