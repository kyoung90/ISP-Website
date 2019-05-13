class CreateInternetPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :internet_packages do |t|
      t.string :plan
      t.float :price
      t.integer :upload_speed
      t.integer :download_speed

      t.timestamps
    end
  end
end
