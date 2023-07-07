class NurseSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :phone, :string
end
