class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new (user_params)

    if @user.save
      log_in
      flash[:success] = "Welcome !"
      redirect_to "/users/#{@user.id}"
    else
      render :new
    end
  end

  def show
    #byebug
    @user = User.find params[:id]
  end

  def destroy
    log_out
    redirect_to root_url
  end
  private

  def user_params
    params.require(:user).permit(:name , :email, :password, :password_confirmation)
  end

end
