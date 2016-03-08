class UsersController < ApplicationController
  before_action :authorize, only: [:edit, :update, :destroy, :profile, :edit_profile]

  def index
    @users = User.all
  end

  def profile
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_edit_path(current_user)
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def destroy
    current_user.destroy
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
    params.require(:user).permit(:name, :age, :gender, :email, :phone, :race, :avatar, :password, :password_confirmation)
  end

end
