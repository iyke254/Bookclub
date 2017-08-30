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

end	



	


	def edit
		@list = List.find(params[:id])
		
	end
	
	def update
		@list= List.find(params[:id])
      	if @list.update(list_params)
      		flash[:notice] = "List successfully updated!"
      		redirect_to lists_path
      	else
      		render :edit
      	end	
    end 

    def destroy
    	@list = List.find(params[:id])
    	@list.destroy
    	flash[:notice] = "List successfully deleted!"
    	redirect_to lists_path
    end				

	private
		def list_params
			params.require(:list).permit(:name)
		end				
end		