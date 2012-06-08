class Article < ActiveRecord::Base

  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :title, :presence => true,
                    :uniqueness => true
end
