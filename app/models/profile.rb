# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
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

class Profile < ActiveRecord::Base
end
