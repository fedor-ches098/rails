class EditForeignKeys < ActiveRecord::Migration[6.1]
  def up
    add_foreign_key :answers, :questions
    add_foreign_key :questions, :tests
    add_foreign_key :test_passages, :tests
    add_foreign_key :test_passages, :users
    add_foreign_key :tests, :categories
    add_foreign_key :tests, :users, column: :author_id
  end

  def down
    remove_foreign_key :answers, :questions
    remove_foreign_key :questions, :tests
    remove_foreign_key :test_passages, :tests
    remove_foreign_key :test_passages, :users
    remove_foreign_key :tests, :categories
    remove_foreign_key :tests, :users, column: :author_id
  end
end
