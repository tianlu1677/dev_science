class Admin::TopicsController < Admin::ApplicationController
  belongs_to :forum, optional: true

  protected
  def permitted_params
    params.permit(topic: [:user_id, :forum_id, :category_id, :author_name, :title, :content, :published_at, :hotted, :close_comment, :position, :status])
  end

  def attributes
    %w(user_email forum_name category_name author_name title content published_at hotted close_comment position status)
  end
end


# == Schema Information
#
# Table name: topics
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  forum_id      :integer
#  category_id   :integer
#  author_name   :string           default("")
#  title         :string           not null
#  content       :text             not null
#  published_at  :datetime         default(Tue, 24 Mar 2015 23:09:04 CST +08:00)
#  hotted        :string           default("f")
#  close_comment :string           default("f")
#  posts_count   :integer          default(0)
#  votes_count   :integer          default(0)
#  views_count   :integer          default(0)
#  words_count   :integer          default(0)
#  position      :integer          default(0)
#  status        :string           default("")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#