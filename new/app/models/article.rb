class Article < ActiveRecord::Base

  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :title, :presence => true,
                    :uniqueness => true

  scope :rating_is_and_above, lambda {|article| where("rating >= ?", article)}

end
