class RemoveForeignKey < ActiveRecord::Migration[6.1]
  def up
    remove_foreign_key :answers, :questions
    remove_foreign_key :gists, :questions
    remove_foreign_key :gists, :users
    remove_foreign_key :questions, :tests
    remove_foreign_key :test_passages, column: :current_question_id
    remove_foreign_key :test_passages, :tests
    remove_foreign_key :test_passages, :users
    remove_foreign_key :tests, :categories
    remove_foreign_key :tests, column: :author_id
  end
end
