class Product < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  validates :name, :presence => true,
                   :uniqueness => true,
                   :length => {:minimum => 1, :maximum => 20}
                   :format => {:with /[a-zA-Z\s]+$/}
end
