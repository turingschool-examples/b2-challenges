class Professor < ApplicationRecord
  has_many :rolls
  has_many :students, through: :rolls
end
