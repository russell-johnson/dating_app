class BiosController < ApplicationController
  before_action :user
  before_action :bio, only: [:index, :show, :edit, :update, :destroy]

  def index
    render :show
  end

  def new
    @bio = Bio.new
  end

  def create
    @bio = @user.bios.new(bio_params)
    if @bio.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bio.update(bio_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @bio.destroy
    redirect_to user_path(@user)
  end

  private

  def user
    @user = User.find(params[:user_id])
  end

  def bio
    @bio = @user.bios[0]
  end

  def bio_params
    params.require(:bio).permit(:description)
  end
end
