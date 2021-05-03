class Restaurant < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates_presence_of :name, :duration, :location, :avatar_link
end
