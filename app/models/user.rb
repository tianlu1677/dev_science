# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  after_create :set_default_role
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles

  has_one :profile, dependent: :destroy
  has_many :experiences, dependent: :destroy
  accepts_nested_attributes_for :profile, :experiences, allow_destroy: true

  has_many :topics, as: :topicable, dependent: :destroy
  has_many :posts, as: :postable,  dependent: :destroy
  has_many :comments, dependent: :destroy


  has_many :memberships, as: :memberable,  dependent: :destroy
  has_many :organizations, through: :memberships

  has_many :groups, through: :memberships

  has_many :comments, as: :commable, dependent: :destroy

  validates :email, presence: true, uniqueness: true


  def display_name
    self.username || self.email.split('@')[0]
  end

  alias avatar! avatar
  def avatar
    self.avatar! || self.create_avatar
  end

  def thumbanil_url
    avatar ? "#{avatar.url}?imageView2/0/w/50/h/50" : nil
  end

  def has_role?(role_name)
    self.roles.pluck(:basename).include?(role_name)
  end

  def set_default_role
    role = Role.find_by(basename: :member)
    self.role_ids = [role.id]
  end

  def user_username
    self.username
  end

end
