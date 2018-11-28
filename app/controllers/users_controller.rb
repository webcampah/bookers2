class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
  	redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book  = Book.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end
end
