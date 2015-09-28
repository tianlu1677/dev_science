class Admin::TopicsController < Admin::ApplicationController


  protected
  # def permitted_params
  #   params.permit(topic: [:user_id, :title, :body, :context_id, :context_type, :position, :status])
  # end
  #
  def attributes
    %w(topicable_id topicable_type user_username title body views_count posts_count position status)
  end
end
