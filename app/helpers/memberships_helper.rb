module MembershipsHelper
  def current_membership(manageable, memberable)
    memberable.memberships.find_by(manageable_id: manageable.id, manageable_type: manageable.class.name)
  end
end

