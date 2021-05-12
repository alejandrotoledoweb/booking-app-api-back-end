class Api::V1::AppointmentsController < ApplicationController
  def index
    @appointments = logged_in_user.appointments
    return json_response(@appointments) if @appointments

    error_message
  end

  def create
    @appointment = logged_in_user.appointments.create(appointment_params)
    return json_response(@appointment, :created) if @appointment.valid?

    error_message
  end

  private

  def appointment_params
    params.permit(:user_id, :restaurant_id, :date, :duration, :status)
  end

  def error_message
    render json: { error: 'You have to login.', status: 'NOT_LOGGED_IN' }
  end
end
