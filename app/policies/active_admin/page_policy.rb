module ActiveAdmin
  class PagePolicy < ApplicationPolicy
    class Scope < Struct.new(:user, :scope)
      def resolve
        scope
      end
    end

    def assignments?
      true
    end

    def households?
      true
    end

    def index?
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def new?
      true
    end

    def update?
      true
    end

    def edit?
      true
    end

    def destroy?
      true
    end
  end
end
