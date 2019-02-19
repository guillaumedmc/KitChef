class BookingPolicy < ApplicationPolicy

  def create?
    true
  end

  def new?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(@user == current_user)
    end
  end
end



