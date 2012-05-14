class User < ActiveRecord::Base

     has_many :products, :dependent => :destroy 
     has_one :country
     #has_many :shared_articles, :dependent =>  :destroy 
     validates :first_name, :presence => true,
                            :length => {:minimum => 1, :maximum => 20},
                            :format => {:with => /[a-zA-Z\s]+$/}
     validates :last_name, :presence => true,
                           :length => {:minimum => 1, :maximum =>20},
                           :format => {:with => /[a-zA-Z\s]+$/}
     validates :email, :presence =>true,
                        :length =>{:minimum => 3, :maximum => 254},
                        :uniqueness => true,
                        :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
      validates :username, :presence => true,
                           :length =>{:minimum => 3, :maximum => 254},
                           :uniqueness => true,
                           :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
    def full_name
     "#{first_name} #{last_name}"
    end
    
end




