class OrganizationsController < ApplicationController
  layout 'application'
  def index
    @q = Organization.online.search(params[:q])
    @organizations = @q.result(distinct: true).page(params[:page] || 1)
  end


  def show
    @organization = Organization.find(params[:id])
    @groups = @organization.groups
    @sub_organizations = Organization.where(parent_id: @organization.id)
  end


  def new
    @organization = Organization.new
  end

  def create
    role = Role.find_by(basename: :super_organization_admin)
    @organization = Organization.new(permit_params)
    organization_user = current_user.organizations_users.new(
        organization_id: @organization.id, desc: :super_organization_admin,
        status: :online, apply_at: Time.now, role_type: role.basename, role_id: role.id)

    if @organization.save and organization_user
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


  protected
  def permit_params
    params.require(:organization).permit(:name, :city, :short_name, :logo, :intro, :desc, :website, :address, :contact_name,
                                         :contact_mobile, :parent_id, :lft, :rgt, :depth, :children_count, :position, :status)
  end

  def attributes
     %w(name short_name contact_name website address city intro desc)
  end

end
