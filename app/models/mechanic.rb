class Mechanic < ApplicationRecord
    has_many :maintenance_logs
    has_many :rides, through: :maintenance_logs

    validates_presence_of :name, :years_experience

    def self.experience_summary
        average('years_experience').to_f.round(1)
    end

    def active_rides
        rides.where(open: true).order(thrill_rating: :desc)
    end
end