class ResourcesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :verify_authenticity_token
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    resourceable_class = params[:resourceable_type].classify.safe_constantize
    @resourceable = resourceable_class.find_by(id: params[:resourceable_id])
    @resources = @resourceable.resources
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save

        format.json {
          render json: { message: 'success', id: @resource.id }, status: 200
        }
      else
        format.html { render :new }
        format.json {
          render json: { error: @resource.errors.full_messages.join(',') }, status: 400
        }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    @resource = Resource.find_by(id: params[:id]) || Resource.new
    respond_to do |format|
      if @resource.update(resource_params)
        format.html {
          redirect_to ResourcesHelper.filter_user([ @app, current_user, @resourceable, @resource ]),
                      notice: t('message.update_success', thing: t('scrinium.resource'))
        }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      session[:previous_url].pop while session[:previous_url].last =~ /resources\/(\d+|new)/
      format.html { redirect_to session[:previous_url].last || root_path, notice: t('message.destroy_success', thing: t('scrinium.resource')) }
    end
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:resource).permit(:title, :desc, :link, :resourceable_id, :resourceable_type, :pdf_link, :position, :status)
  end
end


#  user_id           :integer
#  title             :string
#  resourceable_id   :integer
#  resourceable_type :string
#  desc              :text
#  file_size         :string
#  file_type         :string
#  file_name         :string
#  link              :string
#  pdf_link          :text
#  position          :integer
#  status            :string
#  uuid              :string
#  created_at        :datetime         not null
#  updated_at