class AddOfficeLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :office_location, :string
  end
end
