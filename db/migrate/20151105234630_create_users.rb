class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :identifier, null: false

      t.timestamps
    end

    add_index :users, [:identifier], :unique => true
  end
end
