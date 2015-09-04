class Admin::GroupsController < Admin::ApplicationController


  # protected
  # def permitted_params
  #   params.permit(group: [:name, :short_name, :intro, :desc, :website, :privacy, :position, :status])
  # end
  #
  # def attributes
  #   %w(id  position status)
  # end
end

# == Schema Information
#
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
#