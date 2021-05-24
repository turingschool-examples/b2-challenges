class AmusementPark < ApplicationRecord
  has_many :rides

  def display_price
    '$%.2f' % price
  end
end
