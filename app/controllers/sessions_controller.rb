class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome Back!"
      redirect_to "/users/#{user.id}"
    else
      flash[:danger] = "Oops!! Please Try Again"
      render "new"
    end
  end

  def destroy

  end


end
