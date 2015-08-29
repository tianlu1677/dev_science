class Users::CenterController < ApplicationController
  before_action :authenticate_user!, except: [:logout]
  def current
    @user = User.find current_user.id
  end
end