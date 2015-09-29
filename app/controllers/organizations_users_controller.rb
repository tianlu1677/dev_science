class OrganizationsUsersController < ApplicationController
  layout 'application'
  before_action :get_organization, only: [:new, :create, :update, :destroy]

  def new
    @organizations_user = OrganizationsUser.new
  end

  def create
    @organizations_user = current_user.organizations_users.new(permitted_params)
    if @organizations_user.save
      redirect_to organization_path(@organization)
    else
      flash[:error] = "this is something wrong"
      redirect_to organizations_path
    end
  end

  def update

  end

  def destroy

  end

  protected

  def permitted_params
    params.require(:organizations_user).permit(:user_id, :organization_id, :desc, :apply_at, :reject_reason, :reject_at, :status)
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end


end

# == Schema Information
#
# Table name: organizations_users
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  organization_id :integer
#  desc            :text
#  apply_at        :datetime
#  reject_reason   :text
#  reject_at       :datetime
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#