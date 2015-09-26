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

  def update

  end

  def destroy

  end

  protected
  def permit_params
    params.require(:topic).permit(:context_id, :context_type, :title, :body, :status)
  end


end
