class OrganizationsController < ApplicationController
  layout 'application'
  def index
    @q = Organization.all.search(params[:q])
    @organizations = @q.result.page(params[:page] || 1)
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(permit_params)
    if @organization.save
      redirect_to organization_path(@organization)
    else
      render 'new'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(permit_params)
      redirect_to organization_path(@organization)
    else
      render 'edit'
    end
  end

  def show
    @organization = Organization.find(params[:id])
    @groups = @organization.groups
    @sub_organizations = Organization.where(parent_id: @organization.id)
  end


  protected
  def permit_params
    params.require(:organization).permit(:name, :city, :short_name, :logo, :intro, :desc, :website, :address, :contact_name,
                                         :contact_mobile, :parent_id, :lft, :rgt, :depth, :children_count, :position, :status)
  end

end
