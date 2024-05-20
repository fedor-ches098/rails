class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      t.text :name, null: false
      t.timestamps
    end
  end
end
