class CreateHelloWorlds < ActiveRecord::Migration
  def change
    create_table :hello_worlds do |t|

      t.timestamps
    end
  end
end
