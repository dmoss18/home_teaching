class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.quorum_member && user.quorum_member.authority?
        scope.joins(assignment: :quorum_member).where(quorum_members: { quorum_id: user.quorum_member.quorum_id })
      else
        false
      end
    end
  end

  def quorum_authority?
    return false unless user_is_authority?
    return false unless record.assignment && record.assignment.quorum_member
    record.assignment.quorum_member.quorum_id == user.quorum_member.quorum_id
  end

  def create?
    return false unless current_quorum_member
    return false unless record.assignment
    record.assignment.quorum_member_id == user.quorum_member.id || quorum_authority?
  end
end
