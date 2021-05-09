class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_request!
  def index
    @appointments = @current_user.appointments

    render json: appointments, status: :ok
  end

  def create
    if !@current_user.appointments.find_by(restaurant_id: params[:restaurant_id])
      user_appointment = @current_user.appointments.create(appointments_params)
      if user_appointments.save
        render json: User.find(@current_user.id).restaurants
      else
        render json: { message: user_appointments.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: 'appointment already taken' }, status: :unprocessable_entity

    end
  end

  def destroy
    user_appointment = @current_user.appointments.find_by(motocycle_id: params[:motocycle_id])

    if user_appointment
      user_appointment.destroy
      @appointments = @current_user.restaurants
      render json: @appointments
    else
      render json: { message: "can't find an appointment with the id #{params[:restaurant_id]} " },
             status: :unprocessable_entity
    end
  end

  private

  def appointments_params
    params.permit(:restaurant_id, :user_id, :date, :duration, :status)
  end
end
