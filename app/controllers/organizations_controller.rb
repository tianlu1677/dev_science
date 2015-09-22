class OrganizationsController < ApplicationController
  layout 'application'
  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to organization_path(@organization) and return
    else
      render 'new'
    end

  end

  def show
    @organization = Organization.find(params[:id])
    @groups = @organization.groups
  end


  protected
  def organization_params
    params.require(:organization).permit(:name, :city, :short_name, :intro, :desc, :website, :address, :contact_name,
                                         :contact_mobile, :parent_id, :lft, :rgt, :depth, :children_count, :position, :status)
  end

end
