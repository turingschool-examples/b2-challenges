class AmusementPark < ApplicationRecord
  has_many :rides

  def display_price
    '$%.2f' % price
  end

  def rides_by_name
    rides.by_name
  end
end
