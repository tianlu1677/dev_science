module GroupsHelper
  def current_user_joined_group group
    current_user.groups_users.online.find_by(group_id: group.id)
  end
end
