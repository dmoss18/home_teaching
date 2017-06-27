class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def quorum_authority?
    user.quorum_member && user.quorum_member.authority?
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    quorum_authority?
  end

  def new?
    quorum_authority?
  end

  def update?
    quorum_authority?
  end

  def edit?
    quorum_authority?
  end

  def destroy?
    quorum_authority?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def current_quorum_member
    user.quorum_member
  end

  def current_quorum_id
    user.quorum_member.try(:quorum_id)
  end

  def user_is_authority?
    user.quorum_member && user.quorum_member.authority?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
