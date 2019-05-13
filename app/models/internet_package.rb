class InternetPackage < ApplicationRecord
    has_many :service_periods
    has_many :payments
    has_many :users, through: :payments 
    # has_many :users, through: :service_periods

    # accepts_nested_attributes_for :payments
end
