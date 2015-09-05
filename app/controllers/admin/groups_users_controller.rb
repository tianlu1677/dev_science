class Admin::GroupsUsersController < Admin::ApplicationController
  belongs_to :group, :user,  optional: true

  protected
  def permitted_params
    params.permit(groups_user: [:user_id, :group_id, :role_id, :type, :desc, :apply_at, :reject_reason, :reject_at, :status])
  end

  # def attributes
  #   %w(id  position status)
  # end
end