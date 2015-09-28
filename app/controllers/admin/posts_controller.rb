class Admin::PostsController < Admin::ApplicationController
  belongs_to :topic, optional: true

  # protected
  # def permitted_params
  #   params.permit(topic: [:user_id, :title, :body, :context_id, :context_type, :position, :status])
  # end
  #
  # def attributes
  #   %w(id  context_id context_type user_id title body views_count posts_count position status)
  # end
end
