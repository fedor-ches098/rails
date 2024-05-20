class AddPasswordDigestToUser < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :password_digest, :string
  end
end
