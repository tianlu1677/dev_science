class OrganizationsController < ApplicationController
  layout 'application'
  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end


end
