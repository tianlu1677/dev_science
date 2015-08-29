class Admin::ApplicationController < ActionController::Base

  inherit_resources

  layout "admin"

  # before_action :authenticate_user!, except: [:logout]


  helper_method :attributes
  respond_to :js, :json, :html

  protected

  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.page(params[:page] || 1).per(20))
  end

  def permitted_params
    params_keys = (resource_class.attribute_names - %w(id created_at updated_at )).map(&:to_sym)
    params.permit(resource_class.to_s.downcase.to_sym => params_keys)
  end

  def attributes
    resource_class.attribute_names - %w(id created_at updated_at )
  end

end