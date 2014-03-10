class AddOfficeCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :office_city, :string
  end
end
