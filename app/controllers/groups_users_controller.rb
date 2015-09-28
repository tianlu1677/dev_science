class GroupsUsersController < ApplicationController
  layout 'application'
  before_action :get_group, only: [:index, :new, :create, :update, :destroy]


  def index
    @groups_users = @group.users
  end

  def new
    @groups_user = GroupsUser.new
  end

  def create
    @groups_user = current_user.groups_users.new(permitted_params)
    @groups_user.group_id = params[:group_id]
    if @groups_user.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def update

  end

  def show

  end

  def destroy

  end

  protected

  def permitted_params
    params.require(:groups_user).permit(:user_id, :group_id, :role_id, :desc, :type, :apply_at, :reject_reason, :reject_at, :status)
  end

  def get_group
    @group = Group.find(params[:group_id])
  end

end

# == Schema Information
#
# Table name: groups_users
#
#  id            :integer          not null, primary key
#  group_id      :integer
#  user_id       :integer
#  role_id       :integer
#  type          :string
#  status        :string
#  desc          :text
#  apply_at      :datetime
#  reject_reason :text
#  reject_at     :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
