class HouseholdSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :state, :zip
end
