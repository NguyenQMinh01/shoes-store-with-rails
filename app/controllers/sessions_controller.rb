class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { success: true, user: user }

      binding.pry
      
    else
      render json: { success: false, message: 'Invalid email/password combination' }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { success: true }
  end

  def login
    email = params[:email]
    password = params[:password]

    if user = User.authenticate(email, password)
      render json: { status: 200, user: user }
    else
      puts "Login failed"
      render json: { status: 422, errors: ['Login failed. Invalid email or password.'] }
    end
  end

end
