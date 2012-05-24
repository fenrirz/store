class Article < ActiveRecord::Base


  has_many :comments, :dependent => :destroy
  belongs_to :user  

  validates :title, :presence => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true
                    
   
end
