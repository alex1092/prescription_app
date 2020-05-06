class CreateScripts < ActiveRecord::Migration[6.0]
  def change
    create_table :scripts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.text :details
      t.date :expiration
      t.date :date_printed

      t.timestamps
    end
  end
end
