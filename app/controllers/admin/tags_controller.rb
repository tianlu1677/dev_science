class Admin::TagsController < Admin::ApplicationController
  # belongs_to :user, optional: true



  protected
  def permitted_params
    params.permit(tag: [:name])
  end

  def attributes
    %w(name)
  end
end
