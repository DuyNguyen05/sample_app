class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1'? remember(user) : forget(user)
      flash[:success] = "Xin Chao #{current_user.name} "
      redirect_to "/users/#{user.id}"
    else
      flash[:danger] = "Oops!! Please Try Again"
      render "new"
    end
  end

  def destroy
    log_out
    flash[:info] = "See You!"
    redirect_to root_path
  end


end
