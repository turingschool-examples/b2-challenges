class Ride < ApplicationRecord
    has_many :maintenance_logs
    has_many :mechanics, through: :maintenance_logs

    validates_presence_of :name, :thrill_rating
    validates :open, inclusion: [true,false]
end