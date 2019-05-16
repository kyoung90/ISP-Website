class ServicePeriodsController < ApplicationController
    def index
        if current_user
            user = User.find_by(id: current_user)
            @service_periods = user.service_periods.order(start_time: :desc)
        else
            redirect_to new_session_path, alert: "You must be logged in to do that."
        end 
    end 
end
