class Mechanic < ApplicationRecord
  has_many :rides

  validates_presence_of :name, :years_experience

  def params
  end
end
