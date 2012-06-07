class Country < ActiveRecord::Base

  has_many :user, :dependent => :destroy

  validates :name,  :presence => true,
                    :length => {:minimum => 1, :maximum => 15}

  validates :valid_code
  def valid_code
    self.errors[:code] << "Just can be fill with 'US ID and FRC'"
    if (code != 'us' && code != 'id' && code != 'frc')
    end
  end

end
