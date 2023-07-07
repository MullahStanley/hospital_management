class NursesController < ApplicationController
    before_action :authenticate_nurse, except: [:login]
  
    def login
      nurse = Nurse.find_by(email: params[:email])
      if nurse&.authenticate(params[:password])
        token = nurse.generate_token
        cookies.signed[:auth_token] = {
          value: token.token,
          httponly: true,
          expires: 1.hour.from_now
        }
        render json: { nurse: nurse }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def appointments
      nurse = current_nurse
      appointments = nurse.appointments
      render json: appointments
    end
  
    def create_appointment
      nurse = current_nurse
      patient = Patient.find(params[:patient_id])
      appointment = Appointment.new(nurse: nurse, patient: patient, scheduled_at: params[:scheduled_at])
      if appointment.save
        render json: appointment, status: :created
      else
        render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def schedule_appointment
      appointment = Appointment.find(params[:id])
      appointment.scheduled_at = params[:scheduled_at]
      if appointment.save
        render json: appointment
      else
        render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def edit_appointment
      appointment = Appointment.find(params[:id])
      appointment.update(appointment_params)
      if appointment.save
        render json: appointment
      else
        render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def delete_appointment
      appointment = Appointment.find(params[:id])
      appointment.destroy
      head :no_content
    end
  
    def access_medical_data
      patient = Patient.find(params[:patient_id])
      medical_data = patient.medical_data
      render json: medical_data
    end
  
    private
  
    def appointment_params
      params.require(:appointment).permit(:scheduled_at)
    end
  
    def current_nurse
      token = cookies.signed[:auth_token]
      UserToken.find_by(token: token)&.user
    end
  end
  