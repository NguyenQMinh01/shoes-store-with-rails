class UsersController < ApplicationController
  def create
    if User.where.not(email: nil).where.not(email: '').where(email: user_params[:email]).exists?
      render json: { success: false, message: 'Email đã được sử dụng bởi người dùng khác!' }
    elsif User.exists?(username: user_params[:username])
      render json: { success: false, message: 'Tên đăng nhập đã được sử dụng bởi người dùng khác!' }
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id


        render json: { success: true, message: 'Đăng ký tài khoản thành công!' }
      else
        render json: { success: false, message: 'Đăng ký tài khoản thất bại!' }
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def email_exists?
    User.where.not(username: nil).exists?(email: user_params[:email])
  end

  def email_exists?
    User.where.not(email: ['', nil]).where(email: user_params[:email]).exists?
  end


end
