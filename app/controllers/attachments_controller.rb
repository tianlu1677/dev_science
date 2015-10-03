class AttachmentsController < ApplicationController

  def index
    @q = Attachment.search(params[:q])
    @attachments = @q.result
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
    @attachment.resourceable_id = params[:attachment][:resourceable_id]
    @attachment.resourceable_type = params[:attachment][:resourceable_type]
    @attachment.user_id = current_user.id
    respond_to do |format|
      if @attachment.save!
        format.json { render :json => {files: [@attachment.output_json], status: :created}  }
      else
        format.json { render json: @attachment.error, status: unprocessable_entity }
      end
    end

  end

  def update


  end


  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html {  }
      format.json { head :no_content }
    end
  end


end