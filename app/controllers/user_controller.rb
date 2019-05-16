class UserController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        @user = User.find_by(username: params[:username])
        if @user 
            redirect_to new_user_path, alert: "User already exists."
        else
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end 
    end 

    def edit
        if current_user
            @user = User.find_by(id: current_user)
        else 
            redirect_to new_session_path, alert: "You must be logged in to do that."
        end 
    end 

    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)

        redirect_to user_path(user)
    end 

    def show
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end
