class Ride < ApplicationRecord
  belongs_to :amusement_park
  belongs_to :mechanic

  def self.show_only_open
    where(open: true)
  end

  def self.sort_by_thrill_level
    order(thrill_rating: :desc)
  end
end