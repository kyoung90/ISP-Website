class ApplicationController < ActionController::Base
    helper_method :current_user

    def home 

    end 

    def current_user
        session.has_key?(:user_id) ? session[:user_id] : nil
    end 
end
