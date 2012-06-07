class Category < ActiveRecord::Base

  has_many :products, :through => :categoriesproduct
  has_many :categriesproduct
end
