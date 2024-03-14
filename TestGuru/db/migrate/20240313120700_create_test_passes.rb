class CreateTestPasses < ActiveRecord::Migration[6.1]
  def change
    create_table :test_passes do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.timestamps
    end
  end
end
