class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      puts ("**********logged in*************")
      session[:user_id] = user.id
      flash[:notice] = "Logged In"
      redirect_to "/tests"
    else
      flash[:alert] = "Wrong email or password"
      puts ("**********not logged in*************")
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end
