class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :assignment_type
  has_one :household
end
