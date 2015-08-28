class Admin::TagsController < Admin::ApplicationController
  # belongs_to :user, optional: true

  def index
    @q = resource_class.search(params[:q])
    @forums = @q.result.page(params[:page] || 1).per(20)
  end

  protected
  def permitted_params
    params.permit(tag: [:name])
  end

  def attributes
    %w(name)
  end
end
