class Admin::OrganizationsController < Admin::ApplicationController


  # protected
  # def permitted_params
  #   params.permit(organization: [:name, :city, :position, :status])
  # end
  #
  # def attributes
  #   %w(id  position status)
  # end
end

#  id             :integer          not null, primary key
#  name           :text
#  city           :string
#  short_name     :string
#  intro          :text
#  desc           :text
#  website        :string
#  address        :string
#  contact_name   :string
#  contact_mobile :string
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#  position       :integer
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null