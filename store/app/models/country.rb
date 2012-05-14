class Country < ActiveRecord::Base

      validate :valid_country
      def valid_country
          errors[:country] << "just can filled by 'US ID and FRC'" if (:code != 'US' && :code != 'ID' && :code != 'FRC')
      end

     validates :code,  :presence => true, 
                       :length => {:minimum => 1, :maximum => 15},
                       :format => {:with => /[a-zA-Z\s]+$/}
end




   

