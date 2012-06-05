class Category < ActiveRecord::Base

  has_many :product, :dependent => :destroy

  has_many :child_categories, :dependent => :destroy,
           :class_name => "Category",
           :foreign_key => "parent_id"

  scope :parent_category, where("parent_id is NULL")

  validates :name, :presence => true,
                   :uniqueness => true,
                   :length => {:minimum => 1, :maximum => 30},
                   :format => {:with => /[a-zA-Z\s]+$/}


end
