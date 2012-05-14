class Article < ActiveRecord::Base

  has_many :articles, :dependant => :destroy 
  has_many :valid_comment
           :user_id => "article"
           :condition => "share.include"
  belongs_to :user  

  validates :article, :presence => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

   
end
