class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  add_column :users, :password_digest, :string
  remove_column :users, :password
  def change
  end

end
