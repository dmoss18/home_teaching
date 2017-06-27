class HouseholdPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.quorum_member && user.quorum_member.authority?
        scope.all
      else
        false
      end
    end
  end
end
