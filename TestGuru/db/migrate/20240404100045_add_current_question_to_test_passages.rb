class AddCurrentQuestionToTestPassages < ActiveRecord::Migration[6.1]
  def up
    add_reference :test_passages, :current_question, foreign_key: {to_table: :questions}
  end
end
