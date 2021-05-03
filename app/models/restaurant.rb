class Restaurant < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  validates_presence_of :name, :duration, :location, :avatar_link
end
