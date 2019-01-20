class ApplicationController < ActionController::API
  before_action :authorized

  def issue_token(payload)
    JWT.encode(payload, 'isd3nK')
  end 

  def auth_header
    request.headers['Authorization']
  end 

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin 
        JWT.decode(token, 'isd3nK', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil 
      end 
    end 
  end 

  def current_user 
    if decoded_token
      full_name = decoded_token[0]['full_name']
      @user = User.find_by(full_name: full_name)
    else
      nil
    end
  end 

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
  
end
