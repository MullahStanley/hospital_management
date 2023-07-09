class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :speciality, :phone, :location
end
