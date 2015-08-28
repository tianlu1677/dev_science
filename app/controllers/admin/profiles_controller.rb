class Admin::ProfilesController < Admin::ApplicationController
  # belongs_to :user, optional: true

  # def index
  #   @q = resource_class.search(params[:q])
  #   @profiles = @q.result.page(params[:page] || 1).per(2)
  # end

  protected
  def permitted_params
    params.permit(profile: [:author_name, :intro, :avatar, :blog_url, :sina_url, :github_url])
  end

  def attributes
    %w( user author_name intro avatar blog_url sina_url github_url)
  end
end



# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  author_name :string           default("")
#  intro       :string           default("")
#  avatar      :string
#  blog_url    :string
#  sina_url    :string
#  github_url  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#