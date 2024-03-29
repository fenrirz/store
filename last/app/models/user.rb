class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password
  
  has_many :products,  :dependent => :destroy  
  has_many :articles,  :dependent => :destroy
  has_many :comments,  :dependent => :destroy


    validates :password, :presence => {:on => :create},
                         :confirmation => true
    validates :email, :presence => true, 
                      :uniqueness => true

  def encrypt_password
    if password.present?
          self.password_salt = BCrypt::Engine.generate_salt
          self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
     end
  end

  def self.authenticate(email, password)
  user = find_by_email(email)
  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
  else
    nil
  end
end

  def is_admin
    if self.email == "admin@admin.com"
     true
    end
  end
  
end
