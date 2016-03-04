class UsersController < ApplicationController
  before_action :user, except: [:index, :create, :new]
  def index
    @users = User.all
  end

  def show
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender, :email, :phone, :race)
  end

  def user
    @user = User.find(params[:id])
  end
end
