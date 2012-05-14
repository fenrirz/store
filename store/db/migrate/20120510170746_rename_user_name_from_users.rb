class RenameUserNameFromUsers < ActiveRecord::Migration
  def change
    rename_column :users, :user_name, :username
  end
end
