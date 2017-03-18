class QuorumSerializer < ActiveModel::Serializer
  attributes :id, :name, :quorum_type
  has_one :ward
end
