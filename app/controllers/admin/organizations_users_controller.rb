class Admin::OrganizationsUsersController < Admin::ApplicationController
  belongs_to :organization, :user, optional: true

  protected
  def permitted_params
    params.permit(organizations_user: [:user_id, :organization_id, :desc, :apply_at, :reject_reason, :reject_at, :status])
  end

  # def attributes
  #   %w(id  position status)
  # end
end
