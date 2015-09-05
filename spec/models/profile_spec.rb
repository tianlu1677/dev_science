# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  gender     :string
#  title      :string
#  name       :string           not null
#  mobile     :string
#  avatar     :string
#  city       :string
#  country    :string
#  qq         :string
#  weibo      :string
#  wechat     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
