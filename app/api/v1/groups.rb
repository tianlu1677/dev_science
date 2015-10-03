

module V1
  class Groups < Base
    resource :groups do
      desc 'List all groups.'
      get :names do
        Group.all.map { |g| [ g.id, g.name ] }
      end

      desc 'List all groups where a user is in.'
      params do
        requires :user_id, type: Integer, desc: 'User ID.'
      end
      post :for_user do
        Group.joins(:group_user_associations)
            .where("group_user_associations.user_id = #{params[:user_id]}")
            .map { |g| [ g.id, g.name ] }
      end
    end
  end
end


# module V1
#   class Forums < Base
#
#     resources :forums do
#       paginate per_page: 20, max_per_page: 30, offset: 5
#
#       desc "get all forums"
#       get do
#         { forums: Forum.all, status: 300 }
#         # paginate AdminUser.search(params[:q]).result per_page: params[:per_page] || 20
#       end
#
#       desc "get one forum"
#       get ":id" do
#         @forum = Forum.find(params[:id])
#       end
#
#       desc "create a forum"
#       params do
#         requires :forum, type: Hash do
#           requires :name, type: String, desc: "111"
#           # requires :desc, type: String, desc: "论坛的内容11"
#           optional :topics_count, type: Integer, desc: "论坛的内容11"
#           # requires :position, type: Integer, desc: "论坛的内容11"
#           optional :category_id, type: Integer, desc: "论坛的内容"
#         end
#       end
#
#
#       post do
#         safe_params = ActionController::Parameters.new(params)
#         forum_params = safe_params.require(:forum).permit(:name, :desc)
#         @forum = Forum.new(forum_params)
#         if @forum.save
#           present @forum, with: Leaf::Entities::Forum
#
#           # @forum
#         else
#           { status: 300 }
#         end
#       end
#
#       desc "update"
#       params do
#         requires :forum, type: Hash do
#           requires :id, type: Integer
#           requires :name, type: String
#         end
#       end
#
#       put ":id" do
#         forum = Forum.find(params[:id])
#         forum.update(params)
#       end
#
#       desc "Delete"
#       params do
#         requires :id, type: String, desc: "id"
#       end
#
#       delete ':id' do
#         Forum.find(params[:id]).destroy
#       end
#
#
#
#       #  id           :integer          not null, primary key
#       #  category_id  :integer
#       #  name         :string           not null
#       #  desc         :text             default("")
#       #  topics_count :integer          default(0)
#       #  position     :integer          default(0)
#       #  status       :string
#       #  created_at   :datetime         not null
#       #  updated_at   :datetime         not null
#       #
#
#       # get ":id" do
#       #   @admin_user = AdminUser.find_by_id(params[:id])
#       #   present @admin_user#, :with => APIEntities::DetailCourse
#       # end
#       #
#       # # f = Faraday.post('http://localhost:3000/api/v4/students', {})
#       # # f = Faraday.post('http://localhost:3000/api/v4/students', { student: { no: 'N10000221', name: '齐文龙', major: '软件工程', email: '4122321@qq.com', mobile: '13822112223', school_name: '北航', school_department: '软件学院', school_grade: '2012', school_class: '158', school_start_at: '2014-09-01' } })
#       # params do
#       #   requires :admin_user, type: Hash do
#       #     requires :user_id, type: Integer, desc: "用户ID"
#       #     requires :tenant_id, type: Integer, desc: "租户ID"
#       #     requires :type, type: String, desc: "用户身份"
#       #     requires :sub_type, type: String, desc: "用户子身份"
#       #   end
#       # end
#       # post do
#       #   safe_params = ActionController::Parameters.new(params)
#       #   student_params = safe_params.require(:student).permit(:no, :name, :major, :email, :mobile, :school_name,
#       #                                                         :school_department, :school_grade, :school_class, :school_started_at)
#       #   @admin_user = AdminUser.new(student_params)
#       #
#       #   if @admin_user.save
#       #     present @admin_user
#       #   else
#       #     error!(@admin_user.errors, 200)
#       #   end
#       # end
#       #
#       # put ":id" do
#       #   safe_params = ActionController::Parameters.new(params)
#       #   student_params = safe_params.require(:student).permit(:no, :name, :major, :email, :mobile, :school_name,
#       #                                                         :school_department, :school_grade, :school_class, :school_started_at)
#       #   @admin_user = AdminUser.find_by(params[:id])
#       #   @admin_user.update_attributes(student_params)
#       #   if @admin_user.save
#       #     present @admin_user
#       #   else
#       #     error!(@admin_user.errors, 200)
#       #   end
#       # end
#       #
#       # delete ":id" do
#       #   #TODO
#       # end
#     end
#   end
# end