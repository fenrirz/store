class Category < ActiveRecord::Base

    belongs_to :user
    has_many :products :through => :categoriesproduct
    has_many :categoriesproduct
end
