# app/controllers/items_controller.rb
class AppointmentsController < ApplicationController
  # GET /todos/:todo_id/items
  def index
    @appointments = current_user.appointments
    json_response(@appointments)
  end

  # GET /todos/:todo_id/items/:id
  def show
    json_response(@appointment)
  end

  # POST /todos/:todo_id/items
  def create
    @appointment = current_user.restaurant.appointments.create!(appointment_params)
    json_response(@appointment, :created) if @appointment.valid?
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @appointment.update(appointment_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(:user_id, :restaurant_id, :date, :duration, :status)
  end

end
