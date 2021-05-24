class Ride < ApplicationRecord
  has_many :ride_mechanics, dependent: :destroy
  has_many :mechanics, through: :ride_mechanics
  belongs_to :amusement_park

  def self.by_thrill_rating
    order(thrill_rating: :desc)
  end

  def self.open_only
    where(open: true)
  end

  def self.by_name
    order(Arel.sql('lower(name)'))
  end 
end
