class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome To Articles App #{@user.name}"
      redirect_to articles_path
    else
      
      render :new, status: :unprocessable_entity
    end
  end
def edit
  @user = User.find(params[:id])
end
def update
  @user = User.find(params[:id])
    if @user.update(updated_params)
      flash[:success] = "Detials Updated"
      redirect_to articles_path
    else
     
      render 'edit', status: :unprocessable_entity
    end
end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
   def updated_params
    params.require(:user).permit(:name, :email)
  end
  
end
