class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :identifier, limit:8, null: false
      t.integer :thread_id, limit:8, null: false

      t.timestamps
    end

    add_index :messages, [:identifier, :thread_id], :unique => true
  end
end
