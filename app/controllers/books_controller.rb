class BooksController < ApplicationController

    # call set_book only one for the methos show, edit, update, destroy
    # so comment out @book = Book.find(params[:id]) in these 
    # method
    before_action :set_book, only: [ :show, :edit, :update, :destroy ]
  


    def index
   	  @available_at = Time.now
   	  @books = Book.all
    end

    def show
      #@book = Book.find(params[:id])
    end


	def new
	  @book = Book.new
	end

	def edit
	  #@book = Book.find(params[:id])
	end

    #def create
	#  @book = Book.new(book_params)
	#  @book.save
	#  redirect_to @book
	#end

	def create
    @book = Book.new(book_params)
	    if @book.save
	      redirect_to @book, notice: "#{@book.title} was created!"

	    else
	      render :new
	    end
    end


	#def update
	  #@book = Book.find(params[:id])
	#  @book.update(book_params)
	#  redirect_to @book
	#end

    def update
       if @book.update(book_params)
          redirect_to @book, notice: "#{@book.title} was created!"

       else
       render :new
    end
end

    
	def destroy
	  #@book = Book.find(params[:id])
	  @book.destroy
	  redirect_to books_url
	end


	private

	def book_params
	  params.require(:book).permit(:title, :author, :pages, :price)
	end

	def set_book
      @book = Book.find(params[:id])
    end

end   