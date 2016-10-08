class SessionsController < ApplicationController
  def new #sign in page
  end

  def create
    user = User.find_by_credential(user_params[:username],user_params[:password])
    if user
      log_in(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Wrong login information"]
      render :new
    end
  end

  def show
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
