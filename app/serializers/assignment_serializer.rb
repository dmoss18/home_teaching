class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :assignment_type
  has_one :quorum_member
  has_one :household
end
