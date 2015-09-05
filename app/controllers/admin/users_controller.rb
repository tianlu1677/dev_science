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
    user.build_profile
    if user.save
      flash[:notice] = "创建成功"
      redirect_to admin_users_path
    else
      flash[:error] = "创建失败"
      redirect_to admin_users_path
    end
  end

  helper_method :profile_attributes
  protected
  def permitted_params
    params.permit(user: [:username, :email, :confirmed_at,
                         profile_attributes: [:title, :name, :mobile, :avatar, :city, :country, :qq, :weibo, :wechat]])
  end

  def attributes
    %w(username email confirmed_at)
  end

  def profile_attributes
    Profile.attribute_names - %w(id user_id created_at updated_at)
  end

end
