class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # before_action :load_user_and_commentable, except: [:destroy]
  # before_action :set_comment, only: [:show, :update, :edit]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @commentable.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @commentable.comments.new
  end

  # GET /comments/new/1
  def reply
    @parent_comment = Comment.find(params[:comment_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.js
      else
        # TODO: 处理错误。
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    # respond_to do |format|
    #   format.js
    # end
  end

  private

  def load_user_and_commentable
    # user_id, commentable_type, commentable_id = request.path.match(/\/users\/(\d+)\/(\w+)\/(\d+)/)[1,3]
    commentable_id, commentable_type = 9 , 'Topic'
    # NOTE: 这里要求所有engine命名规则为<主应用名><子应用名>，并且挂在路径为'/<子应用名>'。
    engine = request.path.match(/^\/(\w+)/)[1]

    if engine == 'esm'
      app_name = Rails.app_class.to_s.split('::').first
      commentable_type = app_name+engine.capitalize+'::'+commentable_type#.singularize.classify
      @app = eval("#{app_name.downcase}_#{engine}")
    else
      # commentable_type = commentable_type.singularize.classify
      @app = main_app
    end
    @user = User.find(current_user.id)
    @commentable = commentable_type.constantize.find(commentable_id)
  end

  def commentable_path
    resource, id = request.path.split('/')[1,2]
    "/#{resource}/#{id}"
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_comment
  #   @comment = @commentable.comments.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :content, :user_id, :parent_id, :floor)
  end
end
