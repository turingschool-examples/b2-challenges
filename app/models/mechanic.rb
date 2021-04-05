class Mechanic < ApplicationRecord
    has_many :maintenance_logs
    has_many :rides, through: :maintenance_logs

    validates_presence_of :name, :years_experience
end