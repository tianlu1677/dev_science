class GroupsController < ApplicationController
  layout 'application'

  def index
    @q = Group.search(params[:q])
    @groups = @q.result
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(permitted_params)
    role = Role.find_by(basename: :group_super_admin)
    membership = current_user.memberships.new(
        manageable_id: @group.id, desc: :super_admin, manageable_type: "Group",
        status: :online, apply_at: Time.now, role_type: role.basename, role_id: role.id)
    if @group.save and membership.save
      redirect_to group_path(@group)
    else
      render 'new'
    end

  end

  def show
    @group = Group.find(params[:id])
    @q = @group.topics.search(params[:q])
    @group_topics = @q.result
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(permitted_params)
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end


  protected

  def permitted_params
    params.require(:group).permit(:name, :short_name, :intro, :desc, :website, :privacy, :position, :status, :logo)
  end


end
