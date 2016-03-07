class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      redirect_to '/bogus'
    end
  end
end
