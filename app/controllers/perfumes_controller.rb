class PerfumesController < ApplicationController
    def index
    end
  
    def new
      @perfume = Perfume.new
    end
  
    def show
      @perfume = Perfume.find_by(id: params[:id])
    end
  
    def create
      @perfume = Perfume.new(perfume_params)

      @perfume.user_id = current_user.id

      params[:perfume][:question] ? @perfume.question = params[:perfume][:question].join("") : false
      if @perfume.save
          flash[:notice] = "診断が完了しました"
          redirect_to perfume_path(@perfume.id)
      else
          redirect_to :action => "new"
      end
    end

    def result
       num = params[:num]
       result = Result.new
       result.number = num
       result.user_id = current_user.id

       if result.save
          @result = num
          @perfumes = Perfume.all
          render "perfumes/index"
       else
          redirect_to root_path
    end


   end
  
  private
    def perfume_params
        params.require(:perfume).permit(:id, question: [])
    end
  end


