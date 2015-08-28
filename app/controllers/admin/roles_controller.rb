class Admin::RolesController < Admin::ApplicationController


  def index
    @q = resource_class.search(params[:q])
    @roles = @q.result.page(params[:page] || 1).per(2)
  end

  protected
  def permitted_params
    params.permit(role: [:name, permission_ids: []])
  end

  def attributes
    %w( name )
  end
end
