class ImportsController < ApplicationController
  load_and_authorize_resource

  # GET /imports
  # GET /imports.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imports }
    end
  end

  # GET /imports/1
  # GET /imports/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import }
    end
  end

  # GET /imports/new
  # GET /imports/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import }
    end
  end

  # GET /imports/1/edit
  def edit
  end

  # POST /imports
  # POST /imports.xml
  def create
    respond_to do |format|
      if @import.save

        if @import.file_file_name?
          @import.import
        end


        format.html { redirect_to(@import,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.import'))) }
        format.xml  { render :xml => @import, :status => :created, :location => @import }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imports/1
  # PUT /imports/1.xml
  def update
    respond_to do |format|
      if @import.update_attributes(params[:import])
        format.html { redirect_to(@import,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.import'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.xml
  def destroy
    @import.destroy

    respond_to do |format|
      format.html { redirect_to(imports_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.import'))) }
      format.xml  { head :ok }
    end
  end
end
