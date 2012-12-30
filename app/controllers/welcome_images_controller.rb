class WelcomeImagesController < ApplicationController
  load_and_authorize_resource

  # GET /welcome_images
  # GET /welcome_images.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @welcome_images }
    end
  end

  # GET /welcome_images/1
  # GET /welcome_images/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @welcome_image }
    end
  end

  # GET /welcome_images/new
  # GET /welcome_images/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @welcome_image }
    end
  end

  # GET /welcome_images/1/edit
  def edit
  end

  # POST /welcome_images
  # POST /welcome_images.xml
  def create
    respond_to do |format|
      if @welcome_image.save
        format.html { redirect_to(@welcome_image,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.welcome_image'))) }
        format.xml { render :xml => @welcome_image, :status => :created, :location => @welcome_image }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @welcome_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /welcome_images/1
  # PUT /welcome_images/1.xml
  def update
    respond_to do |format|
      if @welcome_image.update_attributes(params[:welcome_image])
        format.html { redirect_to(@welcome_image,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.welcome_image'))) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @welcome_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /welcome_images/1
  # DELETE /welcome_images/1.xml
  def destroy
    @welcome_image.destroy

    respond_to do |format|
      format.html { redirect_to(welcome_images_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.welcome_image'))) }
      format.xml { head :ok }
    end
  end
end
