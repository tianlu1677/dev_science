class HomeController < ApplicationController

  def index
    if current_user
      redirect_to users_center_index_path
    end
  end
end
