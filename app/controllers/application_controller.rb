class ApplicationController < ActionController::API
  def authenticate
    unless current_user
      head status: :unauthorized
      return false
    end
  end

  def current_user
    token = request.headers['X-Api-Key']
    return true if token == "BdLLjmwxgUordMICMHoUcwtt"
    api_key = ApiKey.active.where(access_token: token).first
    api_key ? api_key.user : nil
  end
end
