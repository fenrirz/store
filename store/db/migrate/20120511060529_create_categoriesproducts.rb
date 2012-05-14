class CreateCategoriesproducts < ActiveRecord::Migration
  def change
    create_table :categoriesproducts do |t|
      t.string  :category_id
      t.string  :product_id
      t.timestamps
    end
  end
end
