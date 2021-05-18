class AppointmentsSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :restaurant

  attributes :date_created, :id, :date, :status, :duration, :restaurant, :location
end
