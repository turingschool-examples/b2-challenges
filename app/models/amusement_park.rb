class AmusementPark< ApplicationRecord

  has_many :rides

  def average_thrill
    rides.sum(:thrill_rating) / (rides.count).to_f
  end

end
