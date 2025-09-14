class SessionsController < ApplicationController
  def new
  end

 def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:success] = "Login successfully"
    redirect_to articles_path
  else
   
    render 'new', status: :unprocessable_entity
  end
end


  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully!"
  end

end
