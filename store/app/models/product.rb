class Product < ActiveRecord::Base

  belongs_to :user
  has_many :categories, :through => :categoriesproduct
  has_many :categoriesproduct
  scope :price_more_than_1000, where ("price > 1000")
  scope :rating_is_and_above lamda {|time| where ("rating >= ?",time)}


end



