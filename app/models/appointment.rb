class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates_presence_of :date, :duration, :status
end
