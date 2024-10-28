class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :user_id, :car_id, :start_date, :end_date, presence: true
end
