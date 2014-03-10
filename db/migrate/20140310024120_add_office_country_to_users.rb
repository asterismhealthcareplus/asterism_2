class AddOfficeCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :office_country, :string
  end
end
