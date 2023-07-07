class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :specialization, :phone, :location
end
