class WantsController < ApplicationController

    def create
        want = current_user.wants.create(book_id: params[:book_id]) #user_idとbook_idの二つを代入
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        want = Want.find_by(book_id: params[:book_id], user_id: current_user.id)
        want.destroy
        redirect_back(fallback_location: root_path)
    end

end
