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


  protected

  def user_params
    params.require(:user).permit(:username, :avatar, profile_attributes: [:gender, :title, :name, :mobile, :city, :county, :qq, :weibo, :wechat])
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
