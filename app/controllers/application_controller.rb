require 'jwt'
class ApplicationController < ActionController::API
    before_action:authorized

  def encode_token(payload)
    JWT.encode(payload,'secret')
  end

 #get request header
  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
        #get the token from header
        token=auth_header.split(' ')[1]
        begin
            JWT.decode(token,'secret',true,algorithm:'HS256')
        rescue JWT::DecodeError
            nil
        end
    end
  end

   def logged_in_user
     #get current logged in user
      if decoded_token
        user_id=decoded_token[0]['user_id']
        @user=User.find_by(id:user_id)
      end
   end

   def logged_in?
     !!logged_in_user
   end

   def authorized
      render json: {message: 'please log in..'},status:401 unless logged_in?
   end

end
