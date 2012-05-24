class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  validates :password, :presence => {:on => :create},
                       :confirmation => true
  validates :email, :presence => true, :uniqueness => true

  has_many :articles, :dependent => :destroy

  has_many :products, :dependent => :destroy 
  belongs_to :country

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

  def is_admin?
    self.email == "fenrirzzzzz@gmail.com"
  end

  #has_many :shared_articles, :dependent =>  :destroy 
  #validates :first_name, :presence => true,
  #                       :length => {:minimum => 1, :maximum => 20},
  #                       :format => {:with => /[a-zA-Z\s]+$/}
  #validates :last_name, :presence => true,
  #                      :length => {:minimum => 1, :maximum =>20},
  #                      :format => {:with => /[a-zA-Z\s]+$/}
  #validates :email, :presence =>true,
  #                   :length =>{:minimum => 3, :maximum => 254},
  #                   :uniqueness => true,
  #                   :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  #validates :username, :presence => true,
  #                     :length =>{:minimum => 3, :maximum => 254},
  #                     :uniqueness => true,
  #                     :format => {:with => /[a-z0-9A-Z\s]+$/}
  def full_name
    "#{first_name} #{last_name}"
  end
    
  
end





