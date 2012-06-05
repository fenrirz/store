class Article < ActiveRecord::Base

  belongs_to :user
  has_many   :comments, :dependent => :destroy

  validates :title, :presence => true,
                    :uniqueness => true,
                    :length => {:minimum => 1, :maximum => 40}
                    :format => {:with => /[a-zA-z\s]+$/}

end
