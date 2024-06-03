class EditColumsBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :value, :string
    rename_column :badges, :title, :name
  end
end
