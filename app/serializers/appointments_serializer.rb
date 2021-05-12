class AppointmentsSerializer < ActiveModel::Serializer
  attributes :date_created, :id, :date, :status, :duration, :rataurant, :location
end
