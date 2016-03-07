class UsersController < ApplicationController
  before_action :user, except: [:show_males, :show_females, :index, :create, :new]
  def index
    @users = User.all
  end

  def show
    @users= User.all
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

  def show_females
    @users = User.all
    @female_users = []
    @users.each do |user|
      if user.gender == "Female"
       @female_users << user
       @users = @female_users
      else
      end
    end
  end

  def show_males
    @users = User.all
    @male_users = []
    @users.each do |user|
      if user.gender == "Male"
       @male_users << user
       @users = @male_users
      else
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender, :email, :phone, :race, :avatar)
  end

  def user
    @user = User.find(params[:id])
  end
end
