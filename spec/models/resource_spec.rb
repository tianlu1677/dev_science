# == Schema Information
#
# Table name: resources
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  title             :string
#  resourceable_id   :integer
#  resourceable_type :string
#  desc              :text
#  file_size         :string
#  file_type         :string
#  file_name         :string
#  link              :string
#  pdf_link          :text
#  position          :integer
#  status            :string
#  uuid              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Resource, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
