class Admin::RolesController < Admin::ApplicationController




  protected
  def permitted_params
    params.permit(role: [:name, permission_ids: []])
  end

  def attributes
    %w( name )
  end
end
