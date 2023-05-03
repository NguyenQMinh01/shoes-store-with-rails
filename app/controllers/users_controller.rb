class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    puts "aaaaaaaaaaaaaaaaaaaaa"
    if @user.save
      render json: {
               message: "User was successfully created."
             },
             status: :created
    else
      render json: {
               errors: @user.errors.full_messages
             },
             status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
