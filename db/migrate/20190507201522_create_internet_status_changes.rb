class CreateInternetStatusChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :internet_status_changes do |t|
      t.boolean :active
      t.string :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
