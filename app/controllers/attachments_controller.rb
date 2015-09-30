class AttachmentsController < ApplicationController

  def index


  end


  def show

  end


  def new

  end


  def edit

  end

  def create
    if params[:attachment][:topic_id]
      @topic = Topic.find(params[:attachment][:topic_id])
      @attachment = @topic.attachments.new(link: params[:attachment][:link])
      @attachment.assetable = @topic
      @attachment.user_id = current_user.id
      if @attachment.save!
        respond_to do |format|
          format.json { render json: {}, status: :ok}
          format.html

        end
      else
        render :json => [{:error => "custom_failure"}], :status => 304
      end
    end

    # p_attr = params[:picture]
    # p_attr[:image] = params[:picture][:image].first if params[:picture][:image].class == Array
    #
    # if params[:gallery_id]
    #   @gallery = Gallery.find(params[:gallery_id])
    #   @picture = @gallery.pictures.build(p_attr)
    # else
    #   @picture = Picture.new(p_attr)
    # end
    #
    # if @picture.save
    #   respond_to do |format|
    #     format.html {
    #       render :json => [@picture.to_jq_upload].to_json,
    #              :content_type => 'text/html',
    #              :layout => false
    #     }
    #     format.json {
    #       render :json => [@picture.to_jq_upload].to_json
    #     }
    #   end
    # else
    #   render :json => [{:error => "custom_failure"}], :status => 304
    # end
  end


  def update


  end


  def destroy

  end


end