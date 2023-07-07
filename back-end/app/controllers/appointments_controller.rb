class AppointmentsController < ApplicationController
    before_action :authenticate_patient, only: [:index, :create, :destroy]
    before_action :authenticate_doctor_or_nurse, only: [:update]
  
    def index
      patient = current_patient
      appointments = patient.appointments
      render json: appointments
    end
  
    def create
      patient = current_patient
      doctor = Doctor.find(params[:doctor_id])
      appointment = patient.appointments.build(doctor: doctor, scheduled_at: params[:scheduled_at])
      if appointment.save
        render json: appointment, status: :created
      else
        render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      appointment = Appointment.find(params[:id])
      if appointment.update(appointment_params)
        render json: appointment
      else
        render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      appointment = current_patient.appointments.find(params[:id])
      appointment.destroy
      head :no_content
    end
  
    private
  
    def appointment_params
      params.require(:appointment).permit(:scheduled_at)
    end
  
    def current_patient
      token = cookies.signed[:auth_token]
      UserToken.find_by(token: token)&.user
    end
  
    def authenticate_patient
      # Add authentication logic for patients
    end
  
    def authenticate_doctor_or_nurse
      # Add authentication logic for doctors and nurses
    end
  end
  
