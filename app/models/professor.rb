class Professor < ApplicationRecord
	validates :name, :age, :specialty, presence: true
end