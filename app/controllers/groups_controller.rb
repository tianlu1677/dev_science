class GroupsController < ApplicationController
  layout 'application'

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create

  end

  def show
    @group = Group.find(params[:id])
    @q = @group.topics.search(params[:q])
    @group_topics = @q.result
  end


  def permitted_params
    params.require(:group).permit(:name, :short_name, :intro, :website, :privacy, :position, :status, :logo)

  end

end
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  short_name :string
#  intro      :text
#  desc       :text
#  website    :string
#  privacy    :string
#  position   :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  logo       :string
#