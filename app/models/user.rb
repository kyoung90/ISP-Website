require "mtik.rb"

class User < ApplicationRecord
    has_many :service_periods
    has_many :payments
    has_many :internet_status_changes

    has_many :internet_packages, through: :service_periods
    # has_many :internet_packages, through: :payments

    has_secure_password

    # Make this return a boolean, it should return true or false on successfull reply 
    def activate_internet
        mt = ::MTik::Connection.new :host => ENV['ROUTER_HOST'], :user => ENV['ROUTER_USERNAME'], :pass => ENV['ROUTER_PASSWORD']

        mt.get_reply('/ppp/secret/set', "=.id=*#{self.id}", "=profile=#{self.payments.last.internet_package.download_speed}M")

        mt.close
    end 
end
