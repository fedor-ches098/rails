class AddTitleLevelIndexToTests < ActiveRecord::Migration[6.1]
  def up
    add_index :tests, [:title, :level], unique: true
  end
end
