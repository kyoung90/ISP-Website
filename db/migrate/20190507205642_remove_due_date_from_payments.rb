class RemoveDueDateFromPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :due_date, :datetime
  end
end
