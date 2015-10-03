class ResourcesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
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
    @resource = @resourceable.resources.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html {
          redirect_to ResourcesHelper.filter_user([ @app, current_user, @resourceable, @resource ]),
                      notice: t('message.create_success', thing: t('scrinium.resource'))
        }
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
    params.require(:resource).permit(:title, :desc, :link, :pdf_link, :position, :status)
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