class Ability
  include CanCan::Ability

  def initialize(user)

    # enumerize :basename, in: [:god_admin,:organization_super_admin, :organization_admin,
    #                           :group_super_admin, :group_admin, :member]

    # :manage: 是指這個 controller 內所有的 action
    # :read : 指 :index 和 :show
    # :update: 指 :edit 和 :update
    # :destroy: 指 :destroy
    # :create: 指 :new 和 :crate

    user ||= User.new
    if user.blank?
      # not loggin in
      cannot :manage, :all
    elsif user.has_role?(:god_admin)
      can :manage, :all
    elsif user.has_role?(:member)
      basic_read_only
      can :update, :destroy, Topic do |topic|
        (topic.user_id == user.id)
      end

      can :update, :destroy, Comment do |comment|
        (comment.user_id == user.id)
      end

      if user.has_role?(:organization_super_admin) || user.has_role?(:organization_admin)
        can :update, Organization do |organization|
          organization.user_ids.include?(user.id) || organization.users.online.include(user)
        end

        ## 机构创建者只能删除新创建的，以及有两名成员以下的机构
        can :destroy, Organization do |organization|
          organization.user_ids.include?(user.id) and (organization.status == "check") || (organization.users.online.size < 3 )
        end

      end
      if user.has_role?(:organization_admin)

      end
      if user.has_role?(:group_super_admin)

      end
      if user.has_role?(:group_admin)

      end
    else
      cannot :manage, :all
    end


    protected
    def basic_read_only
      can :read, Topic

      can :read, Comment
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    ## 数据库做权限配置，暂时不用
    #return unless user.present?
    # can :manage, :all and return #if user.email == '1035232764@qq.com'
    #
    # user.roles.each do |role|
    #   role.permissions.each do |permission|
    #     if permission.subject_id.nil?
    #       can permission.action.to_sym, permission.subject_class.constantize
    #     else
    #       can permission.action.to_sym, permission.subject_class.constantize, :id => permission.subject_id
    #     end
    #   end
    # end
  end
end
