class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { success: true, user: user }
    else
      render json: { success: false, message: 'Invalid email/password combination' }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { success: true }
  end
end
