class Ride < ApplicationRecord
  has_many :mechanics

  validates_presence_of :name, :thrill_rating, :open

  def params
  end
end
