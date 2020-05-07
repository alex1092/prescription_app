class AddKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :key, :string
  end
end
