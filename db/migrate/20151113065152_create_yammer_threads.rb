class CreateYammerThreads < ActiveRecord::Migration
  def change
    create_table :threads do |t|
      t.integer :yammer_id, limit:8, null: false

      t.timestamps
    end

    add_index :threads, [:yammer_id], :unique => true
  end
end
