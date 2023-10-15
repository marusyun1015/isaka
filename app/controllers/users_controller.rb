class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        @perfumes = Perfume.all
    end

end
