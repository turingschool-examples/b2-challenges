class Ride < ApplicationRecord
  belongs_to :mechanic

  def self.show_only_open
    where(open: true)
  end
end