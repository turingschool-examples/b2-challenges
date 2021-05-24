class Mechanic < ApplicationRecord
  has_many :rides, dependent: :destroy
end
