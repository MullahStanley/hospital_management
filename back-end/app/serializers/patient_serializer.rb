class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age, :gender, :medical_history, :password_digest
end
