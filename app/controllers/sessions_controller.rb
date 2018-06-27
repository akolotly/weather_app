class SessionsController < ApplicationController

  def new
    if current_user.present?
      redirect_to admin_dashboard_path
    else
      @user = User.new
    end
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to(admin_dashboard_path, notice: 'Авторизация успешна!')
    else
      flash.now[:alert] = 'Недействительный адрес электронной почты или пароль!'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_back_or_to(new_session_path, notice: 'Вы вышли из системы!')
  end
end
