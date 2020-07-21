class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :billday, :string
    add_column :users, :usertype, :string
  end
end
