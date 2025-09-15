class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  
  def new
    @user = User.new
  end
  

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
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
      redirect_to user_path(@user)
    else
     
      render 'edit', status: :unprocessable_entity
    end
end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
   def updated_params
    params.require(:user).permit(:name, :email)
  end
  
end
