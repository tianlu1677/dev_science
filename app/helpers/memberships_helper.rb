module MembershipsHelper
  def current_membership(manageable, memberable)
    memberable.memberships.find_by(manageable_id: manageable.id, manageable_type: manageable.class.name)
  end

  # 判断用户是不是当前机构、讨论组的管理员
  def admin_membership?(manageable, memberable)
    memberable.memberships.online.find_by(manageable_id: manageable.id, manageable_type: manageable.class.name, role_type: :admin)
  end

end

