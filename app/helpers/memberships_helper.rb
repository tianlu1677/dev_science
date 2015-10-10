module MembershipsHelper
  def current_user_membership(manageable)
    current_user.memberships.find_by(manageable_id: manageable.id, manageable_type: manageable.class.name)
  end
end

