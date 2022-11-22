class AddUserIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :users, index: { name: "AuthorID" }, foreign_key: true
  end
end
