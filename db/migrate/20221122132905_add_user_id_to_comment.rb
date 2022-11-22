class AddUserIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :users, :integer
    add_index :comments, :users
  end
end
