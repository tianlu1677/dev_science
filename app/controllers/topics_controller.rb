class TopicsController < ApplicationController
  layout 'application'


  def show
    @topic = Topic.find(params[:id])
    @group = Group.find(params[:group_id])
  end

end
