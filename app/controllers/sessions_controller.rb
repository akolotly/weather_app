class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to(cities_path, notice: 'Авторизация успешна!')
    else
      flash.now[:alert] = 'Недействительный адрес электронной почты или пароль!'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to(new_session_path, notice: 'Вы вышли из системы!')
    # redirect_to root_url
  end
end

