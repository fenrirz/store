class CreateCategoriesproducts < ActiveRecord::Migration
  def change
    create_table :categoriesproducts do |t|


      t.integer  :category_id
      t.integer  :product_id
      t.timestamps
    end
  end
end
