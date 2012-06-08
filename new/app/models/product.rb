class Product < ActiveRecord::Base

  belongs_to :user
  has_many :categories, :through => :categoriesproduct
  has_many :categoriesproducts

  scope :price_more_than_1000, where ("price > '1000'")
  
end
