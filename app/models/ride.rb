class Ride < ApplicationRecord
  belongs_to :mechanic

  validates_presence_of :name, :thrill_rating, :open

  def params
  end
end
