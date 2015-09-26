class GroupsController < ApplicationController
  layout 'application'

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @q = @group.topics.search(params[:q])
    @group_topics = @q.result
  end

end
