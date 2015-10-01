class AttachmentsController < ApplicationController

  def index
    @attachments = Attachment.all
    respond_to do |format|
      format.json { render json: @attachments, status: :ok}
      format.html
    end
  end


  def show

  end


  def new

  end


  def edit

  end

  def create
    attachments_link =  params[:attachments][:link].class == Array ? params[:attachments][:link].first : params[:attachments][:link]
    @attachment = Attachment.new(link: attachments_link)
    @attachment.assetable_id = params[:attachment][:assetable_id]
    @attachment.assetable_type = params[:attachment][:assetable_type]
    @attachment.user_id = current_user.id

    if @attachment.save!
      respond_to do |format|
        format.html {
          render :json => @attachment.output_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json {
          render :json => @attachment.output_json
        }
      end

    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end


  def update


  end


  def destroy

  end


end