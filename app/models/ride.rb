class Ride < ApplicationRecord
  has_and_belongs_to_many :mechanics

  def self.by_thrill_rating_desc
    order(thrill_rating: :desc)
  end
end
