class BooksController < ApplicationController
   def index
   	  @available_at = Time.now
   	  #@books = ["Atlas Shrugged", "Ender's game", "Hamlet", "The Hobbit"]
   	  @books = Book.all
   end
end   