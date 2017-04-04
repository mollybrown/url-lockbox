class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login Successful!"
      redirect_to '/'
    else
      flash[:alert] = "Login Unsuccessful. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
