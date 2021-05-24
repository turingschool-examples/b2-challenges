class Ride < ApplicationRecord
  belongs_to :mechanic

  def self.show_only_open
    where(open: true)
  end

  def self.sort_by_thrill_level
    order(thrill_rating: :desc)
  end

  def self.order_alphabetically
    order(:name)
  end

  def self.average_thrill_rating
    average(:thrill_rating)
  end
end