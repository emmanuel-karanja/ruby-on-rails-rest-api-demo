class Api::V1::UsersController < ApplicationController
    before_action:find_user, only: [:show,:update,:destroy]
    before_action :authorized, only: [:auto_login,:index,:show,:update,:destroy]
    def index
        @users=User.all
        render json: @users
    end

    #GET /user/:id
    def show
        render json: @user
    end

    #POST /users

     def create
        @user=User.create(user_params)
        if @user.valid?
          token=encode_token({user_id: @user.id})
          render json: {user: @user,token: token}
        else
            render error: {error:'Unable to create User.'},status: 400    
        end
     end

      def login
        @user=User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token=encode_token({user_id:@user.id})
            render json: {user: @user,token: token}
        else
            render json: {error: "Invalid username or password"}
        end
      end
    
    def auto_login
        render json: @user   
    end
    

     #PUT /users/:id
     def update
        if @user
             @user.update(user_params)
             render json: {message: 'User successfully updated.'},status: 200
        else
            render json: {error:'Unable to update User.'},status: 400
        end
     end

     #DELETE /users/:id
     def destroy
        if @user
            @user.destroy
            render json: {message:'User successfully deleted.'},status: 200
        else
            render json: {error: 'Unable to delete User.'},status: 400
        end
     end

     private

     def user_params
        if params[:user].is_a? String
            params[:user]
        else
           params.permit(:username,:password)
        end
     end

     def find_user
        @user=User.find(params[:id])
     end


       
end
