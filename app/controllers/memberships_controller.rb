class MembershipsController < ApplicationController
  layout 'application'
  before_action :get_manageable

  def index
    @q = @manageable.memberships.online.search(params[:q])
    @memberships = @q.result.page(params[:page] || 1)
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = current_user.memberships.new(permitted_params)
    if @membership.save
      redirect_to organization_path(@manageable)
    else
      flash[:error] = "this is something wrong"
      redirect_to organizations_path
    end
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    @membership = Membership.find(params[:id])
    status = params[:membership][:status]
    reject_reason = params[:membership][:reject_reason]
    role_type = params[:membership][:role_type]
    if status == "check"
      @membership.update(status: :check, role_type: nil, role_id: nil, reject_reason: nil, reject_at: nil )
    elsif status == "online"
      role = Role.find_by(basename: role_type)
      @membership.update(status: :online, role_type: role_type, role_id: role.try(:id), reject_reason: nil, reject_at: nil )
    elsif status == "offline"
      @membership.update(status: :offline, role_type: nil, role_id: nil, reject_reason: reject_reason, reject_at: Time.now )
    end
  end

  def destroy

  end

  def manage
    @q = @manageable.memberships.search(params[:q])
    @memberships = @q.result(distinct: true).page(params[:page] || 1).per(20)
  end

  def leave
    if current_user.memberships.where(manageable_id: @manageable.id).destroy_all
      @success = true
    else
      @success = false
    end
  end

  protected

  def permitted_params
    params.require(:membership).permit(:desc, :manageable_id, :manageable_type, :memberable_id, :memberable_type, :apply_at, :reject_reason, :reject_at, :status)
  end

  def get_manageable
    @manageable = Organization.find(params[:organization_id]) if params[:organization_id]
    @manageable = Group.find(params[:group_id]) if params[:group_id]
  end

end


# == Schema Information
#
# Table name: memberships
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  manageable_id   :integer
#  manageable_tye  :string
#  memberable_id   :integer
#  memberable_type :string
#  desc            :text
#  apply_at        :datetime
#  reject_reason   :text
#  reject_at       :datetime
#  last_user_id    :integer
#  status          :string
#  role_type       :string
#  role_id         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null