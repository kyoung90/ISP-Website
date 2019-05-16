class InternetStatusChangesController < ApplicationController
    def index
        user = User.find_by(id: current_user)
        if user 
            @internet_status_changes = user.internet_status_changes.order(created_at: :desc)
        else 
            redirect_to new_session_path, alert: "You must be logged in to do that."
        end 
    end
end
