class CreateQuestions < ActiveRecord::Migration[6.1]
  def up
    create_table :questions do |t|
      t.text :body, null: false
      t.references :test, foreign_key: true
      t.timestamps
    end
  end
end
