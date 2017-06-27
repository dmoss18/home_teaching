class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.quorum_member && user.quorum_member.authority?
        scope.joins(:quorum_member).where(quorum_members: { quorum_id: user.quorum_member.quorum_id })
      else
        raise Pundit::NotAuthorizedError, "not allowed to view assignments"
      end
    end
  end

  def quorum_authority?
    return false unless user_is_authority?
    return false unless record.quorum_member
    record.quorum_member.quorum_id == user.quorum_member.quorum_id
  end
end
