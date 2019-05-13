class CreateServicePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :service_periods do |t|
      t.integer :user_id
      t.integer :internet_package_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
