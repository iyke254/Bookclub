class BooksController < ApplicationControlller

	def index
		@books = Book.all
		render : index
	end
end	