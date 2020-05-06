class AddFirstNameToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
    add_column :doctors, :phone, :string
  end
end
