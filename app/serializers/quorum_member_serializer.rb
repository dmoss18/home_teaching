class QuorumMemberSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  has_one :user
  has_one :household
  has_one :quorum
end
