class Users::CenterController < ApplicationController
  before_action :authenticate_user!, except: [:logout]
  def index
    @user = User.find(current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render 'edit'
    else
      flash[:note] = 'good'
    end
  end

  def show

  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_password_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  def joined_organizations
    @memberships = current_user.memberships#.includes(:organizations)
  end

  def joined_groups
    @groups_users = current_user.groups_users
  end

  protected

  def user_params
    params.require(:user).permit(:username, :avatar, profile_attributes: [:gender, :title, :name, :mobile, :city, :county, :qq, :weibo, :wechat])
  end

  def user_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

end

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
#  city       :string
#  country    :string
#  qq         :string
#  weibo      :string
#  wechat     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
