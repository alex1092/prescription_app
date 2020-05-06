class CreateScripts < ActiveRecord::Migration[6.0]
  def change
    create_table :scripts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :details
      t.date :expiration
      t.string :doctor

      t.timestamps
    end
  end
end
