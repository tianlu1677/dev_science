class TopicsController < ApplicationController
  layout 'application'

  def new
    @topic = Topic.new
    @group = Group.find(params[:group_id])
    @topic = current_user.topics.new
    @topic.topicable = @group
    @topic.user_id = current_user.id
    if @topic.save(validate: false)
      redirect_to edit_group_topic_path(@group, @topic)
    else
      render 'new'
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @topic = current_user.topics.new(permit_params)
    @topic.topicable = @group
    @topic.user_id = current_user.id
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
    @group = Group.find(params[:group_id])
    @topic = Topic.find(params[:id])

    @attachment = @topic.attachments.build
    @attachments = []
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
    params.require(:topic).permit( :title, :body, :status, :tag_list)
  end


end
