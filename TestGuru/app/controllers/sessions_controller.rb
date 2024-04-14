class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name} Guru"
      redirect_to(cookies.delete(:before_url) || tests_path)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = "Goodbuy!"
    redirect_to root_path
  end
end
