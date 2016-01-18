class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.new_record?
      render json: {}, status: 422
    else
      render json: user.session_api_key, status: 201
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end
end
