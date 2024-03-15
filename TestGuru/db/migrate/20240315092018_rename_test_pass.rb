class RenameTestPass < ActiveRecord::Migration[6.1]
  def change
    rename_table :test_passes, :test_passages
  end
end
