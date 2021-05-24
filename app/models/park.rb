class Park < ApplicationRecord
  has_many :rides

  def rides_ordered_alphabetically
    self.rides.order(:name)
  end

  def average_thrill_rating
    self.rides.average(:thrill_rating)
  end
end