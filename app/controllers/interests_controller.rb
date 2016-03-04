class InterestsController < ApplicationController

  before_action :user
  before_action :interest, only: [:edit, :update, :destroy]

  def index
    @interests = @user.interests.all
  end

  def show
  end

  def edit
  end

  def update
      if @interest.update(interest_params)
        redirect_to user_interests_path(@user, @interest)
      else
        render :edit
    end
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = @user.interests.new(interest_params)
    if @interest.save
      redirect_to user_interests_path(@user)
    else
      render :new
    end
  end

  def destroy
    @interest.destroy
    redirect_to user_interests_path(@user)
  end

  private

  def interest_params
     params.require(:interest).permit(:name)
  end

  def user
      @user = User.find(params[:user_id])
    end

  def interest
    @interest = @user.interests.find(params[:id])
  end
end
