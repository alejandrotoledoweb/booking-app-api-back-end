# app/controllers/items_controller.rb
module V1
  class AppointmentsController < ApplicationController
    def index
      @appointments = current_user.appointments
      json_response(@appointments)
    end

    def show
      json_response(@appointment)
    end

    def create
      @appointment = current_user.restaurant.appointments.create!(appointment_params)
      json_response(@appointment, :created) if @appointment.valid?
    end

    def update
      @appointment.update(appointment_params)
      head :no_content
    end

    def destroy
      @appointment.destroy
      head :no_content
    end

    private

    def appointment_params
      params.permit(:user_id, :restaurant_id, :date, :duration, :status)
    end
  end
end
