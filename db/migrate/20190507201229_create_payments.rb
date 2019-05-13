class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :internet_package_id
      t.datetime :payed_date
      t.datetime :due_date
      t.integer :months

      t.timestamps
    end
  end
end
