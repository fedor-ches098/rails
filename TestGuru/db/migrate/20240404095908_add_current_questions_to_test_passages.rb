class AddCurrentQuestionsToTestPassages < ActiveRecord::Migration[6.1]
  def up
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
