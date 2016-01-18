class SessionController < ApplicationController
  def create
    user = User.where("username = ? OR email = ?",
                  params[:username_or_email],
                  params[:username_or_email],
                ).first

    if user && user.authenticate.(params[:password])
      render json: user.reset_token!, status: 201
    else
      render json: {}, status: 401
    end
  end
end
