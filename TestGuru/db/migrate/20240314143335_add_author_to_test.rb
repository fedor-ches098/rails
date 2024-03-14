class AddAuthorToTest < ActiveRecord::Migration[6.1]
  def change
    remove_reference :tests, :user, foreign_key: true
    add_reference :tests, :author, foreign_key: { to_table: :users }
  end
end
