class SessionController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth
            @user = User.find_or_create_by(id: auth['uid']) do |u|
                u.username = auth['info']['name']
                u.email = auth['info']['email'] 
            end
            session[:user_id] = @user.id
            redirect_to internet_packages_path

        else 
            @user = User.find_by(username: user_params[:username])

            if @user && @user.authenticate(user_params[:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else
                redirect_to new_session_path, alert: "User or password does not match."
            end
        end 

        
    end 

    def destroy
        session.clear
        redirect_to new_session_path
    end 

    def user_params
        params.require(:user).permit(:username, :password)
    end 

    def auth
        request.env['omniauth.auth']
    end
end
