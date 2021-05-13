class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates_presence_of :date, :duration, :status

  
end

# @appointments = logged_in_user.appointments
# return json_response(full_appointments(@appointments)) if @appointments
# return json_response(@appointments) if @appointments

# def full_appointments(appointments)
#   full_appointments = []
#   appointments.each do |app|
#     full_appointments << {
#       date_created: app.created_at,
#       id: app.id,
#       date: app.date,
#       status: app.status,
#       duration: app.duration,
#       restaurant: app.restaurant[:name],
#       location: app.restaurant[:location]
#     }
#   end
#   full_appointments
# end
