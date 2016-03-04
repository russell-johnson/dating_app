class AddressesController < ApplicationController
  before_action :user
  before_action :address, except: [:index, :create, :new]


  def index
  end

  def edit

  end

  def update
    if @address.update(address_params)
      redirect_to user_address_path(@user, @address)
    else
      render :edit
    end
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @address.destroy
    redirect_to user_path(@user)
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

  def user
    @user = User.find(params[:user_id])
  end

  def address
    @address = @user.addresses.find(params[:id])
  end
end
