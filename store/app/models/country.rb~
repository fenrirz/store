class Country < ActiveRecord::Base

      has_many :users, :dependent => :destroy

      validate :name, :presence => true,
                       :length => {:minimum => 1, :maximum => 15}
      validate :valid_code
      def valid_code
         self.errors[:code] << "just can be filled with 'US ID and FRC'" if (code != 'US' && code != 'ID' && code != 'FRC')
      end

     
end


