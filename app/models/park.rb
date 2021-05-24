class Park < ApplicationRecord
  has_many :rides, dependent: :destroy

end
