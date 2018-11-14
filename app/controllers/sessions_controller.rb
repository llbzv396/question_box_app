class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login completed!"
      log_in(user)
      redirect_to controller: 'users', action: 'show', id: user.id
    else
      flash.now[:danger] = "E-mail address or password is wrong!"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "Logout completed!"
    redirect_to root_path
  end
end
