class Admin::PostsController < Admin::ApplicationController


  # protected
  # def permitted_params
  #   params.permit(topic: [:user_id, :title, :body, :context_id, :context_type, :position, :status])
  # end
  #
  # def attributes
  #   %w(id  context_id context_type user_id title body views_count posts_count position status)
  # end
end


#
#  id           :integer          not null, primary key
#  context_id   :integer
#  context_type :string
#  user_id      :integer
#  title        :text
#  body         :text
#  views_count  :integer
#  posts_count  :integer
#  position     :integer
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#