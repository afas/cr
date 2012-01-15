class FlatsController < ApplicationController
  load_and_authorize_resource

  # GET /flats
  # GET /flats.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @flats }
    end
  end

  # GET /flats/1
  # GET /flats/1.xml
  def show
    respond_to do |format|
      format.html { render :layout => "with_gmaps" }
      format.xml { render :xml => @flat }
    end
  end

  # GET /flats/new
  # GET /flats/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @flat }
    end
  end

  # GET /flats/1/edit
  def edit
    render :layout => "with_aloha"
  end

  # POST /flats
  # POST /flats.xml
  def create
    respond_to do |format|
      if @flat.save
        format.html { redirect_to(@flat,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.flat'))) }
        format.xml { render :xml => @flat, :status => :created, :location => @flat }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @flat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flats/1
  # PUT /flats/1.xml
  def update
    respond_to do |format|
      if @flat.update_attributes(params[:flat])
        format.html { redirect_to(@flat,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.flat'))) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @flat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flats/1
  # DELETE /flats/1.xml
  def destroy
    @flat.destroy

    respond_to do |format|
      format.html { redirect_to(flats_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.flat'))) }
      format.xml { head :ok }
    end
  end
end
