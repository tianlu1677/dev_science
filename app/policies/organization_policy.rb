class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


  def update?
    #record.super_admin_id ==  user.id || record.memberships.online.pluck(:memberable_id).includes?(user.id)
    false
  end


end
