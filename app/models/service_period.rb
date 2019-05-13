class ServicePeriod < ApplicationRecord
    belongs_to :internet_package
    belongs_to :user

    def self.create_or_find_and_update(internet_package, user, time, months)
        # cancel last service period if we change plan and create a internet status change
        if user.service_periods.count > 0 && user.service_periods.any?{|service_period| service_period.end_time > time }
            # last payment plan is the same as last service period plan
            if user.payments.last.internet_package.plan == user.service_periods.last.internet_package.plan && user.service_periods.last.end_time > time
                service_period = user.service_periods.find{|service_period| service_period.end_time > time}
                service_period.end_time = service_period.end_time + (months * 30).days
                service_period.save
                service_period
            else
                ServicePeriod.create(internet_package_id: internet_package.id, user_id: user.id, start_time: time, end_time: time + (30 * months).days)
            end 
                # service_period = user.service_periods.find{|service_period| service_period.end_time > time}
                # service_period.end_time = end_time + (months * 30).days
                # service_period.save
                # service_period
        else 
            ServicePeriod.create(internet_package_id: internet_package.id, user_id: user.id, start_time: time, end_time: time + (30 * months).days)
        end 
    end 
end
