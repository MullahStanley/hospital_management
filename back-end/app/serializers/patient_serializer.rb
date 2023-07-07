class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :condition, :password
end
