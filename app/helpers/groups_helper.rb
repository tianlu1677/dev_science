module GroupsHelper
  def user_joined_group(group)
    current_user.groups_users.find_by(group_id: group.id)
  end
end
