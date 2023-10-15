class BooksController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
        @books = Book.all
        @liked = Book.includes(:liked_users).limit(3).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
        @wanted = Book.includes(:wanted_users).limit(3).sort {|a,b| b.wanted_users.size <=> a.wanted_users.size}
 
     if params[:search] == nil
         @books= Book.all
     elsif params[:search] == ''
         @books= Book.all
     else
          #部分検索
         @books = Book.where("movie LIKE ? or point LIKE?",'%' + params[:search] + '%','%' + params[:search] + '%')
     end

    end
      
    def new
        @book = Book.new
    end
    
    def create
        book = Book.new(book_params)
        book.user_id = current_user.id
        if book.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @book = Book.find(params[:id])

        @comments = @book.comments
        @comment = Comment.new
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        book = Book.find(params[:id])
        if book.update(book_params)
            redirect_to :action => "success", :id => book.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        book = Book.find(params[:id])
        # book変数の中にBook.find(params[:id])が代入されている
        book.destroy
        # それをdestroyする
        redirect_to action: :index
    end

    private
    def book_params
        params.require(:book).permit(:story, :movie, :year, :title, :image, :point)
    end

end

# commentコントローラーとcommentコントローラーを削除し、やり直す
