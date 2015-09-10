class OrganizationsController < ApplicationController
  layout 'application'
  def index
    @organizations = Organization.all
  end

  def new

  end

  def show
    @organization = Organization.find(params[:id])
    @groups = @organization.groups
  end


end
