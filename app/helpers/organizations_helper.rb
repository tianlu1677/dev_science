module OrganizationsHelper
  def current_user_joined_organization(organization)
    Membership.find_by(memberable: current_user, manageable: organization)
  end
end

