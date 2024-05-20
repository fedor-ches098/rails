class RemoveColumnNameFromUser < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :name
  end
end
