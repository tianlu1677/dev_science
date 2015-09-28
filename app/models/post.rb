# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  body          :string
#  postable_id   :integer
#  postable_type :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Post < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:new, :online, :offline], default: :online

  belongs_to :postable, polymorphic: true
  has_many :comments, dependent: :destroy

end
