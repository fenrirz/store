class RemovePasswordHasFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password_has
  end

  def down
    add_column :users, :password_has, :string
  end
end
