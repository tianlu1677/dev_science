class Users::CenterController < ApplicationController
  before_action :authenticate_user!, except: [:logout]
  def index
    @user = User.find current_user.id
  end

  def edit

  end
end