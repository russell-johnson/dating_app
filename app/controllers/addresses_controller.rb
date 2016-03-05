class AddressesController < ApplicationController
  before_action :user
  # before_action :address, except: [:create, :new, :destroy, :edit, ]
  def index
    @addresses = Address.where(user_id: @user.id)
  end

  def show
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_addresses_path(@user)
    else
      render :edit
    end
  end

  def new
    @address = @user.addresses.new
  end

  def create
    @address = @user.addresses.new(address_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to user_addresses_path(@user)
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip, :user_id)
  end

  def user
    @user = User.find(params[:user_id])
  end

  def address
    @address = Address.find(params[:id])
  end

end
