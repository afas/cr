class TendersController < ApplicationController
  load_and_authorize_resource

  # GET /tenders
  # GET /tenders.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tenders }
    end
  end

  # GET /tenders/1
  # GET /tenders/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tender }
    end
  end

  # GET /tenders/new
  # GET /tenders/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tender }
    end
  end

  # GET /tenders/1/edit
  def edit
  end

  # POST /tenders
  # POST /tenders.xml
  def create
    respond_to do |format|
      if @tender.save
        format.html { redirect_to(@tender,
                                  :notice => I18n.t('backend.actions.success_create',
                                                    :model => I18n.t('activerecord.capitalized_models.tender'))) }
        format.xml  { render :xml => @tender, :status => :created, :location => @tender }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tender.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tenders/1
  # PUT /tenders/1.xml
  def update
    respond_to do |format|
      if @tender.update_attributes(params[:tender])
        format.html { redirect_to(@tender,
                                  :notice => I18n.t('backend.actions.success_update',
                                                    :model => I18n.t('activerecord.capitalized_models.tender'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tender.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.xml
  def destroy
    @tender.destroy

    respond_to do |format|
      format.html { redirect_to(tenders_url,
                                :notice => I18n.t('backend.actions.success_destroy',
                                                  :model => I18n.t('activerecord.capitalized_models.tender'))) }
      format.xml  { head :ok }
    end
  end
end
