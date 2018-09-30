class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    puts @user.email
    if @user.nil?
      redirect_to users_sing_in_path, alert: 'El usuario no existe'
      return
    end

    if @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to users_sing_in_path, alert: 'El password no es válido'
    end
  end

  def destroy
    reset_session
    redirect_to users_sing_up_path
  end
end
