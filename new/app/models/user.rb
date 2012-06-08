class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  has_many :products, :dependent => :destroy
  belongs_to :country
  has_many :articles, :dependent => :destroy
  has_many :shared_articles,
           :class_name => "Article",
           :foreign_key => "user_id",
           :conditions => "status LIKE'%share%'"


  def show_full_name
    "#{self.first_name} #{self.last_name}"
  end

  #validates :first_name, :presence => true,
  #                       :length => {:minimum => 1, :maximum => 20},
  #                       :format => {:with => /[a-zA-Z\s]+$/}
  #validates :last_name,  :presence => true,
  #                       :length => {:minimum => 1, :maximum => 20},
  #                       :format => {:with => /[a-zA-Z\s]+$/}
  validates :email,      :presence => true,
                         :uniqueness => true
  #validates :username,   :presence => true,
  #                      :uniqueness => true
  validates :password, :presence => {:on => :create},
                       :confirmation => true
  
  def encrypt_password
    if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
       end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password,       user.password_salt)
    user
    else
      nil
    end
  end

  def is_admin
    if current_user.email == "fenrirzzzzz@gmail.com"
      true
    else
      false
    end
  end


  
end
