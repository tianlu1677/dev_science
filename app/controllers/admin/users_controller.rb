class Admin::UsersController < Admin::ApplicationController

  def index
    @q = resource_class.search(params[:q])
    @users = @q.result.page(params[:page] || 1).per(20)
  end

  def create
    user = User.new({ email: params[:user][:email],
                      password: params[:user][:password],
                      password_confirmation: params[:user][:password_confirmation],
                      confirmed_at: DateTime.now
                    })
    if user.save
      flash[:notice] = "创建成功"
      redirect_to admin_users_path
    else
      flash[:error] = "创建失败"
      redirect_to admin_users_path
    end
  end

  def attributes
    %w( username email )
  end

end