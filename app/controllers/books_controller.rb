class BooksController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "Book was successfully updated."
			redirect_to book_path(@book)
		else
		@user = current_user
		@books = Book.all
		render :index
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
				flash[:notice] = "Book was successfully updated."
				redirect_to book_path(@book)
		else
				render :edit
		end
    end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:book_title, :book_body)
	end

	def correct_user
		book = Book.find(params[:id])
		if current_user.id != book.user.id
			redirect_to root_path
		end
	end

end
