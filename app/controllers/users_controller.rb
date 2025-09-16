class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome To Articles App, #{@user.name} 🎉"
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(updated_params)
      flash[:success] = "Details updated successfully ✅"
      redirect_to user_path(@user)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil
      flash[:success] = 'Account Deleted Successfully'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to user_path(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def updated_params
    params.require(:user).permit(:name, :email)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit or delete your own account ⚠️"
      redirect_to @user
    end
  end
end
