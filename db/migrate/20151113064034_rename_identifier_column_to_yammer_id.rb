class RenameIdentifierColumnToYammerId < ActiveRecord::Migration
  def change
    rename_column :messages, :identifier, :yammer_id
  end
end
