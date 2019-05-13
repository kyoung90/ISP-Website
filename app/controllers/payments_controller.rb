class PaymentsController < ApplicationController
    

    def index
        user = User.find_by(id: current_user)
        if user 
            @payments = user.payments.order(payed_date: :desc)
        else 
            redirect_to new_session_path, alert: "You must be logged in to do that."
        end 
    end 

    def create
        internet_package = InternetPackage.find_by(id: params[:internet_package_id])
        user = User.find_by(id: current_user)
        if internet_package && user
            @payment = internet_package.payments.create(payment_params)
            if @payment 
                time = DateTime.now
                @payment.payed_date = time
                @payment.user = user 
                @payment.save
                
                # this should happen after the internet connected
                @service_period = ServicePeriod.create_or_find_and_update(internet_package, user, time, params[:payment][:months].to_i)

                
                # attempt mikrotik connection

                user.activate_internet

                redirect_to payments_path
            else 
                redirect_to payments_path, alert: "Something went wrong. Payment not processed"
            end 
        else 
            redirect_to internet_packages_path, alert: "Package not found or you are not logged in"
        end     
    end 
   
    def payment_params
        params.require(:payment).permit(:months)
    end 
end
