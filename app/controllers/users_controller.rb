class UsersController < ApplicationController
  def create #creates new users
    user = User.new(user_params)
    if user.save
      log_in(user)
      flash[:message] = "Logged IN!!!!"
      redirect_to user_url(user)  #user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def new #render sign up page
    #render :users/new
  end

  def show #render user page
    #render user_url(user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

# <input name="user[name]">
# params {users: {username: deifh, paswword: hejf}, otherthings: {}}
