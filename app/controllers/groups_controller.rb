class GroupsController < ApplicationController
  layout 'application'

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(permitted_params)
    @groups_user = @group.groups_users.new(user_id: current_user.id, role_id: 1, desc: 'super_admin', authority: :super_admin)
    if @group.save and @groups_user.save
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
