class AppointmentSerializer < ActiveModel::Serializer
  attributes :date, :patient_id, :doctor_id, :duration, :appointment_type
end
