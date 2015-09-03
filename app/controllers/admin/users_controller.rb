class Admin::UsersController < Admin::ApplicationController

  def index
    @q = resource_class.search(params[:q])
    @users = @q.result.page(params[:page] || 1).per(2)
  end

  def create
    user = User.new({ email: params[:user][:email],
                      password: params[:user][:password],
                      password_confirmation: params[:user][:password_confirmation],
                      confirmed_at: DateTime.now
                    })
    user.save
    redirect_to admin_users_path
  end

  def attributes
    %w( email )
  end

end