class NurseSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :department, :specialiaty
end
