class UsersController < ApplicationController
before_action :authenticate, only: [ :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :check , only:[:new ,:create]
before_action :verify_admin? , only: [:destroy]


  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new (user_params)
    if @user.save
      log_in @user
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

  def edit
    @user = User.find params[:id]

  end

  def update
    @user = User.find params[:id]
      if @user.update! user_params
        flash[:success] = "Profile Updated!!"
        redirect_to "/users/#{@user.id}"
      else
        render :edit
      end

  end

  def destroy_login
    log_out
    redirect_to root_url
  end

  def destroy
    #byebug
    @user.destroy
    #@user =User.find(params[:id]).destroy
    flash[:success] = "User destroyed!"
    redirect_to "/users"
  end

  private

  def user_params
    params.require(:user).permit(:name , :email, :password, :password_confirmation)
  end

  def authenticate
    return if logged_in?
    flash[:danger] = "You do not Permission!!"
    redirect_to root_url
  end

  def correct_user
    @user = User.find(params[:id])
    return if @user == current_user
    flash[:warning] = "NOT Permission!!"
    redirect_to root_url
  end

  def verify_admin?
    @user = User.find(params[:id])
    return if current_user.admin?
    redirect_to root_url
  end

end
