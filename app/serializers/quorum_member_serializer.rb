class QuorumMemberSerializer < QuorumMemberBaseSerializer
  has_one :user
  has_one :household
  has_one :quorum
end
