class Park < ApplicationRecord
  has_many :rides, dependent: :destroy

  def self.rides_by_name
    order(:name)
  end
end
