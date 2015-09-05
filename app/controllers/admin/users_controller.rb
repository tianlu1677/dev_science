class Admin::UsersController < Admin::ApplicationController


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
    profile_params_keys = (Profile.attribute_names - %w(id user_id created_at updated_at)).map(&:to_sym)
    params.permit(user: [:username, :email, :confirmed_at,
                         profile_attributes: profile_params_keys])
  end

  def attributes
    %w(username email confirmed_at)
  end

  def profile_attributes
    Profile.attribute_names - %w(id user_id created_at updated_at)
  end

end
