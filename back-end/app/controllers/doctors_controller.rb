class DoctorsController < ApplicationController
    before_action :authenticate_doctor, except: [:login]
  
    def login
      doctor = Doctor.find_by(email: params[:email])
      if doctor&.authenticate(params[:password])
        token = doctor.generate_token
        cookies.signed[:auth_token] = {
          value: token.token,
          httponly: true,
          expires: 1.hour.from_now
        }
        render json: { doctor: doctor }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def appointments
      doctor = current_doctor
      appointments = doctor.appointments
      render json: appointments
    end
  
    def create_appointment
      doctor = current_doctor
      patient = Patient.find(params[:patient_id])
      appointment = Appointment.new(doctor: doctor, patient: patient, scheduled_at: params[:scheduled_at])
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
  
    def current_doctor
      token = cookies.signed[:auth_token]
      UserToken.find_by(token: token)&.user
    end
  end
  
