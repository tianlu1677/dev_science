class Admin::PermissionsController < Admin::ApplicationController

  def index
    @q = resource_class.search(params[:q])
    @permissions = @q.result.page(params[:page] || 1).per(2)
  end

end
