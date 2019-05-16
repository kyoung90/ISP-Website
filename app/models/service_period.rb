class ServicePeriod < ApplicationRecord
    belongs_to :internet_package
    belongs_to :user

    def self.create_or_find_and_update(internet_package, user, time, months)
        # cancel last service period if we change plan and create a internet status change
        # update first nested if because the last end time should ways be higher than the time if there is any service period endtime which is greater than time
        if user.service_periods.count > 0 && user.service_periods.any?{|service_period| service_period.end_time > time }
            # last payment plan is the same as last service period plan
            if user.payments.last.internet_package.plan == user.service_periods.last.internet_package.plan# && user.service_periods.last.end_time > time
                service_period = user.service_periods.find{|service_period| service_period.end_time > time}
                service_period.end_time = service_period.end_time + (months * 30).days
                service_period.save
                service_period
                
                last_internet_status_change = user.internet_status_changes.last
                last_internet_status_change.active = false
                last_internet_status_change.save

                user.internet_status_changes.create(active: true, comment: "Previous Service Updated.")
            else
                last_service_period = user.service_periods.last
                last_service_period.end_time = time 
                last_service_period.save 

                ServicePeriod.create(internet_package_id: internet_package.id, user_id: user.id, start_time: time, end_time: time + (30 * months).days)
                
                last_internet_status_change = user.internet_status_changes.last
                last_internet_status_change.active = false
                last_internet_status_change.save
                user.internet_status_changes.create(active: true, comment: "Previous service period canceled. New service period created.")
            end 
                # service_period = user.service_periods.find{|service_period| service_period.end_time > time}
                # service_period.end_time = end_time + (months * 30).days
                # service_period.save
                # service_period
        else 
            ServicePeriod.create(internet_package_id: internet_package.id, user_id: user.id, start_time: time, end_time: time + (30 * months).days)
            user.internet_status_changes.create(active: true, comment: "New service period created.")
        end 
    end 
end
