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
    if params[:parent_id]
      @parent_organization = Organization.find_by(id: params[:parent_id])
      new_params = {}
      %w( city  website address contact_name contact_mobile).collect do |attribute|
        new_params.merge!({attribute.to_sym => @parent_organization.send(attribute)})
      end
      @organization = Organization.new(new_params)
    else
      @organization = Organization.new
    end

  end

  def create
    role = Role.find_by(basename: :organization_super_admin)
    @organization = Organization.new(permit_params)
    membership = current_user.memberships.new(
        manageable_id: @organization.id, desc: :super_admin, manageable_type: "Organization",
        status: :online, apply_at: Time.now, role_type: role.basename, role_id: role.id)

    if @organization.save and membership
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

  def destroy
    @organization = Organization.find(params[:id])
    if @organization.destroy
      redirect_to organizations_path
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
