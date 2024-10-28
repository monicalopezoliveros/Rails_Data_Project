class Car < ApplicationRecord
  has_many :rentals

  validates :brand, :model, :year, :price_per_day, presence: true
end
