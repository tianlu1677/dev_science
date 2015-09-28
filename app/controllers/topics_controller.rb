class TopicsController < ApplicationController
  layout 'application'

  def new
    @group = Group.find(params[:group_id])
    @topic = Topic.new
  end

  def create
    @group = Group.find(params[:group_id])
    @topic = current_user.topics.new(permit_params)
    @topic.context = @group
    if @topic.save
      redirect_to group_topic_path(@group, @topic)
    else
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @topic = Topic.find(params[:id])
    if @topic.update(permit_params)
      redirect_to group_topic_path(@group, @topic)
    else
      render 'edit'
    end
  end

  def destroy

  end

  protected
  def permit_params
    params.require(:topic).permit(:context_id, :context_type, :title, :body, :status, :tag_list)
  end


end
