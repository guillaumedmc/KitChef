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

  def toggle_enable_status?
    true
  end

  class Scope < Scope
    def resolve
      scope.all.select { |record| record.user == user }
    end
  end
end



