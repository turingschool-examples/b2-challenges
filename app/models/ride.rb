class Ride <ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides
  def self.is_open
    self.where(open: :true)
  end

  def self.ordered
    self.order(thrill_rating: :desc)
  end
end