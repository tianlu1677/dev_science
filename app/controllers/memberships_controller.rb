class MembershipsController < ApplicationController
  layout 'application'
  before_action :get_manageable, only: [:new, :index, :edit]

  def index
    @q = @manageable.memberships.search(params[:q])
    @memberships = @q.result.includes(:memberable).page(params[:page] || 1)
  end

  def new
    @membership = Membership.new
  end

  def create
    if params[:join_type]  == "invite"
      @membership = Membership.new(permitted_params)
    else
      @membership = current_user.memberships.new(permitted_params)
    end
    if @membership.save
      @manageable = @membership.manageable
      @success = true
    else
      @success = false
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
    @membership = Membership.find(params[:id]).destroy
    @manageable = @membership.manageable
    if @membership.destroy
      @success = true
    else
      @success = false
    end
  end

  protected

  def permitted_params
    params.require(:membership).permit(:desc, :manageable_id, :manageable_type, :memberable_id, :memberable_type,
                                       :apply_at, :reject_reason, :role_type, :reject_at, :status)
  end

  def get_manageable
    manageable_class = params[:manageable_type].classify.safe_constantize
    @manageable = manageable_class.find_by(id: params[:manageable_id])
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