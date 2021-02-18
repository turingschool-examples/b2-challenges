class Professor < ApplicationRecord
  has_many :students, dependent: :destroy
end
