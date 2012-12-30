class FlatImagesController < ApplicationController
  load_and_authorize_resource

  # GET /flat_images
  # GET /flat_images.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @flat_images }
    end
  end

  # GET /flat_images/1
  # GET /flat_images/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @flat_image }
    end
  end

  # GET /flat_images/new
  # GET /flat_images/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @flat_image }
    end
  end

  # GET /flat_images/1/edit
  def edit
  end

  # POST /flat_images
  # POST /flat_images.xml
  def create
    respond_to do |format|
      if @flat_image.save
        format.html { redirect_to(@flat_image,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.flat_image'))) }
        format.xml { render :xml => @flat_image, :status => :created, :location => @flat_image }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @flat_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flat_images/1
  # PUT /flat_images/1.xml
  def update
    respond_to do |format|
      if @flat_image.update_attributes(params[:flat_image])
        format.html { redirect_to(@flat_image,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.flat_image'))) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @flat_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flat_images/1
  # DELETE /flat_images/1.xml
  def destroy
    @flat_image.destroy

    respond_to do |format|
      format.html { redirect_to(flat_images_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.flat_image'))) }
      format.xml { head :ok }
    end
  end
end
