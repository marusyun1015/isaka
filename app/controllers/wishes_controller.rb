class LikesController < ApplicationController

    def create
      wish = current_user.wishes.create(book_id: params[:book_id]) #user_idとbook_idの二つを代入
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
      wish = Wish.find_by(book_id: params[:book_id], user_id: current_user.id)
      wish.destroy
      redirect_back(fallback_location: root_path)
    end
  
  end
