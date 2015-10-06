class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  inherit_resources
  layout 'application'

  helper_method :attributes

  def attributes
    resource_class.attribute_names - %w(id created_at updated_at )
  end
end
