class PatientsController < ApplicationController
    
  def login
    patient = Patient.find_by(email: params[:email])
    if patient&.authenticate(params[:password])
      token = patient.generate_token
      cookies.signed[:auth_token] = {
        value: token.token,
        httponly: true,
        expires: 1.hour.from_now
      }
      render json: { patient: patient }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  
    def create
        patient = Patient.new(patient_params)
        if patient.save
            token = patient.generate_token
            render json: { patient: patient, token: token }, status: :created
        else
            render json: { error:'Invalid email or password' }, status: :unauthorised
        end
    end

    def appointments
        patient = current_patient
        appointments = patient.appointments
        render json: appointments
      end
    
      def book_appointment
        patient = current_patient
        doctor = Doctor.find(params[:doctor_id])
        appointment = patient.appointments.build(doctor: doctor, scheduled_at: params[:scheduled_at])
        if appointment.save
          render json: appointment, status: :created
        else
          render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def delete_appointment
        patient = current_patient
        appointment = patient.appointments.find(params[:id])
        appointment.destroy
        head :no_content
      end
    
      private
    
        def patient_params
          params.require(:patient).permit(:name, :email, :password, :password_confirmation)
        end
    
        def current_patient
          token = cookies.signed[:auth_token]
          UserToken.find_by(token: token)&.user
        end
end