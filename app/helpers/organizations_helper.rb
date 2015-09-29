module OrganizationsHelper
  def current_user_joined_organization(organization)
    current_user.organizations_users.find_by(organization_id: organization.id)
  end
end

