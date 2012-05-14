class ChangeCodeFromCountries < ActiveRecord::Migration
  def change
    change_column :countries, :code, :string
  end
end
