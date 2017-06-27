class QuorumMemberPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.quorum_member && user.quorum_member.authority?
        scope.where(quorum_id: user.quorum_member.quorum_id)
      else
        raise Pundit::NotAuthorizedError, "not allowed to view quorum members"
      end
    end
  end

  def quorum_authority?
    return false unless user_is_authority?
    record.quorum_id == user.quorum_member.quorum_id
  end
end
