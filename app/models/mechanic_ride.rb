class MechanicRide < ApplicationRecord
  belongs_to :mechanic
  belongs_to :ride

  def order_by_thrill

  end
end
